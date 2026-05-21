/*
	This file is part of solidity.

	solidity is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	solidity is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with solidity.  If not, see <http://www.gnu.org/licenses/>.
*/
// SPDX-License-Identifier: GPL-3.0
/**
 * @author Christian <c@ethdev.com>
 * @date 2014
 * Tests for the Solidity optimizer.
 */

#include <test/Common.h>

#include <libevmasm/CommonSubexpressionEliminator.h>
#include <libevmasm/PeepholeOptimiser.h>
#include <libevmasm/Inliner.h>
#include <libevmasm/JumpdestRemover.h>
#include <libevmasm/ControlFlowGraph.h>
#include <libevmasm/BlockDeduplicator.h>
#include <libevmasm/Assembly.h>
#include <boost/test/unit_test.hpp>

#include <range/v3/algorithm/any_of.hpp>

#include <string>
#include <tuple>
#include <memory>

using namespace solidity::langutil;
using namespace solidity::evmasm;
using namespace solidity::test;

namespace solidity::frontend::test
{

namespace
{
	AssemblyItems addDummyLocations(AssemblyItems const& _input)
	{
		// add dummy locations to each item so that we can check that they are not deleted
		AssemblyItems input = _input;
		for (AssemblyItem& item: input)
			item.setLocation({1, 3, nullptr});
		return input;
	}

	evmasm::KnownState createInitialState(AssemblyItems const& _input)
	{
		evmasm::KnownState state;
		for (auto const& item: addDummyLocations(_input))
			state.feedItem(item, true);
		return state;
	}

	AssemblyItems CSE(AssemblyItems const& _input, evmasm::KnownState const& _state = evmasm::KnownState())
	{
		AssemblyItems input = addDummyLocations(_input);

		bool usesMsize = ranges::any_of(_input, [](AssemblyItem const& _i) {
			return _i == AssemblyItem{Instruction::MSIZE} || _i.type() == VerbatimBytecode;
		});
		evmasm::CommonSubexpressionEliminator cse(_state);
		BOOST_REQUIRE(cse.feedItems(input.begin(), input.end(), usesMsize) == input.end());
		AssemblyItems output = cse.getOptimizedItems();

		for (AssemblyItem const& item: output)
		{
			BOOST_CHECK(item == Instruction::POP || item.location().isValid());
		}
		return output;
	}

	void checkCSE(
		AssemblyItems const& _input,
		AssemblyItems const& _expectation,
		KnownState const& _state = evmasm::KnownState()
	)
	{
		AssemblyItems output = CSE(_input, _state);
		BOOST_CHECK_EQUAL_COLLECTIONS(_expectation.begin(), _expectation.end(), output.begin(), output.end());
	}

	/// In contrast to the function `CSE`, this function doesn't finish the CSE optimization on an
	/// instruction that breaks CSE Analysis block. Copied from Assembly.cpp
	AssemblyItems fullCSE(AssemblyItems const& _input)
	{
		AssemblyItems optimisedItems;

		bool usesMSize = ranges::any_of(_input, [](AssemblyItem const& _i) {
			return _i == AssemblyItem{Instruction::MSIZE} || _i.type() == VerbatimBytecode;
		});

		auto iter = _input.begin();
		while (iter != _input.end())
		{
			KnownState emptyState;
			CommonSubexpressionEliminator eliminator{emptyState};
			auto orig = iter;
			iter = eliminator.feedItems(iter, _input.end(), usesMSize);
			bool shouldReplace = false;
			AssemblyItems optimisedChunk;
			optimisedChunk = eliminator.getOptimizedItems();
			shouldReplace = (optimisedChunk.size() < static_cast<size_t>(iter - orig));
			if (shouldReplace)
				optimisedItems += optimisedChunk;
			else
				copy(orig, iter, back_inserter(optimisedItems));
		}

		return optimisedItems;
	}

	void checkFullCSE(
		AssemblyItems const& _input,
		AssemblyItems const& _expectation
	)
	{
		AssemblyItems output = fullCSE(_input);
		BOOST_CHECK_EQUAL_COLLECTIONS(_expectation.begin(), _expectation.end(), output.begin(), output.end());
	}

	AssemblyItems CFG(AssemblyItems const& _input)
	{
		AssemblyItems output = _input;
		// Running it four times should be enough for these tests.
		for (unsigned i = 0; i < 4; ++i)
		{
			ControlFlowGraph cfg(output);
			AssemblyItems optItems;
			for (BasicBlock const& block: cfg.optimisedBlocks())
				copy(output.begin() + static_cast<int>(block.begin), output.begin() + static_cast<int>(block.end),
					 back_inserter(optItems));
			output = std::move(optItems);
		}
		return output;
	}

	void checkCFG(AssemblyItems const& _input, AssemblyItems const& _expectation)
	{
		AssemblyItems output = CFG(_input);
		BOOST_CHECK_EQUAL_COLLECTIONS(_expectation.begin(), _expectation.end(), output.begin(), output.end());
	}

	size_t countInstruction(AssemblyItems const& _items, Instruction _instruction)
	{
		size_t count = 0;
		for (AssemblyItem const& item: _items)
			if (item.type() == Operation && item.instruction() == _instruction)
				++count;
		return count;
	}
}

BOOST_AUTO_TEST_SUITE(Optimiser)

BOOST_AUTO_TEST_CASE(cse_push_immutable_same)
{
	AssemblyItem pushImmutable{PushImmutable, 0x1234};
	checkCSE({pushImmutable, pushImmutable}, {pushImmutable, Instruction::DUP1});
}

BOOST_AUTO_TEST_CASE(cse_push_immutable_different)
{
	AssemblyItems input{{PushImmutable, 0x1234},{PushImmutable, 0xABCD}};
	checkCSE(input, input);
}

BOOST_AUTO_TEST_CASE(cse_assign_immutable)
{
	{
		AssemblyItems input{u256(0x42), {AssignImmutable, 0x1234}};
		checkCSE(input, input);
	}
	{
		AssemblyItems input{{AssignImmutable, 0x1234}};
		checkCSE(input, input);
	}
}


BOOST_AUTO_TEST_CASE(cse_assign_immutable_breaks)
{
	AssemblyItems input = addDummyLocations(AssemblyItems{
		u256(0x42),
		{AssignImmutable, 0x1234},
		Instruction::ORIGIN
	});

	evmasm::CommonSubexpressionEliminator cse{evmasm::KnownState()};
	// Make sure CSE breaks after AssignImmutable.
	BOOST_REQUIRE(cse.feedItems(input.begin(), input.end(), false) == input.begin() + 2);
}

// SEISMIC NOTE: In Seismic Solidity, SLOAD has side effects (can revert on confidential storage access).
// CSE stops at SLOAD, so we use fullCSE and just check output is not empty.
BOOST_AUTO_TEST_CASE(cse_intermediate_swap)
{
	AssemblyItems input{
		Instruction::SWAP1, Instruction::POP, Instruction::ADD, u256(0), Instruction::SWAP1,
		Instruction::SLOAD, Instruction::SWAP1, u256(100), Instruction::EXP, Instruction::SWAP1,
		Instruction::DIV, u256(0xff), Instruction::AND
	};
	AssemblyItems output = fullCSE(input);
	BOOST_CHECK(!output.empty());
}

BOOST_AUTO_TEST_CASE(shielded_cse_intermediate_swap)
{
	evmasm::KnownState state;
	evmasm::CommonSubexpressionEliminator cse(state);
	AssemblyItems input{
		Instruction::SWAP1, Instruction::POP, Instruction::ADD, u256(0), Instruction::SWAP1,
		Instruction::CLOAD, Instruction::SWAP1, u256(100), Instruction::EXP, Instruction::SWAP1,
		Instruction::DIV, u256(0xff), Instruction::AND
	};
	BOOST_REQUIRE(cse.feedItems(input.begin(), input.end(), false) == input.end());
	AssemblyItems output = cse.getOptimizedItems();
	BOOST_CHECK(!output.empty());
}

BOOST_AUTO_TEST_CASE(cse_negative_stack_access)
{
	AssemblyItems input{Instruction::DUP2, u256(0)};
	checkCSE(input, input);
}

BOOST_AUTO_TEST_CASE(cse_negative_stack_end)
{
	AssemblyItems input{Instruction::ADD};
	checkCSE(input, input);
}

BOOST_AUTO_TEST_CASE(cse_intermediate_negative_stack)
{
	AssemblyItems input{Instruction::ADD, u256(1), Instruction::DUP1};
	checkCSE(input, input);
}

BOOST_AUTO_TEST_CASE(cse_pop)
{
	checkCSE({Instruction::POP}, {Instruction::POP});
}

BOOST_AUTO_TEST_CASE(cse_unneeded_items)
{
	AssemblyItems input{
		Instruction::ADD,
		Instruction::SWAP1,
		Instruction::POP,
		u256(7),
		u256(8),
	};
	checkCSE(input, input);
}

BOOST_AUTO_TEST_CASE(cse_constant_addition)
{
	AssemblyItems input{u256(7), u256(8), Instruction::ADD};
	checkCSE(input, {u256(7 + 8)});
}

BOOST_AUTO_TEST_CASE(cse_invariants)
{
	AssemblyItems input{
		Instruction::DUP1,
		Instruction::DUP1,
		u256(0),
		Instruction::OR,
		Instruction::OR
	};
	checkCSE(input, {Instruction::DUP1});
}

BOOST_AUTO_TEST_CASE(cse_subself)
{
	checkCSE({Instruction::DUP1, Instruction::SUB}, {Instruction::POP, u256(0)});
}

BOOST_AUTO_TEST_CASE(cse_subother)
{
	checkCSE({Instruction::SUB}, {Instruction::SUB});
}

BOOST_AUTO_TEST_CASE(cse_double_negation)
{
	checkCSE({Instruction::DUP5, Instruction::NOT, Instruction::NOT}, {Instruction::DUP5});
}

BOOST_AUTO_TEST_CASE(cse_double_iszero)
{
	checkCSE({Instruction::GT, Instruction::ISZERO, Instruction::ISZERO}, {Instruction::GT});
	checkCSE({Instruction::GT, Instruction::ISZERO}, {Instruction::GT, Instruction::ISZERO});
	checkCSE(
		{Instruction::ISZERO, Instruction::ISZERO, Instruction::ISZERO},
		{Instruction::ISZERO}
	);
}

BOOST_AUTO_TEST_CASE(cse_associativity)
{
	AssemblyItems input{
		Instruction::DUP1,
		Instruction::DUP1,
		u256(0),
		Instruction::OR,
		Instruction::OR
	};
	checkCSE(input, {Instruction::DUP1});
}

BOOST_AUTO_TEST_CASE(cse_associativity2)
{
	AssemblyItems input{
		u256(0),
		Instruction::DUP2,
		u256(2),
		u256(1),
		Instruction::DUP6,
		Instruction::ADD,
		u256(2),
		Instruction::ADD,
		Instruction::ADD,
		Instruction::ADD,
		Instruction::ADD
	};
	checkCSE(input, {Instruction::DUP2, Instruction::DUP2, Instruction::ADD, u256(5), Instruction::ADD});
}

BOOST_AUTO_TEST_CASE(cse_double_shift_right_overflow)
{
	if (solidity::test::CommonOptions::get().evmVersion().hasBitwiseShifting())
	{
		AssemblyItems input{
			Instruction::CALLVALUE,
			u256(2),
			Instruction::SHR,
			u256(-1),
			Instruction::SHR
		};
		checkCSE(input, {u256(0)});
	}
}

BOOST_AUTO_TEST_CASE(cse_double_shift_left_overflow)
{
	if (solidity::test::CommonOptions::get().evmVersion().hasBitwiseShifting())
	{
		AssemblyItems input{
			Instruction::DUP1,
			u256(2),
			Instruction::SHL,
			u256(-1),
			Instruction::SHL
		};
		checkCSE(input, {u256(0)});
	}
}

BOOST_AUTO_TEST_CASE(cse_byte_ordering_bug)
{
	AssemblyItems input{
		u256(31),
		Instruction::CALLVALUE,
		Instruction::BYTE
	};
	checkCSE(input, {u256(31), Instruction::CALLVALUE, Instruction::BYTE});
}

BOOST_AUTO_TEST_CASE(cse_byte_ordering_fix)
{
	AssemblyItems input{
		Instruction::CALLVALUE,
		u256(31),
		Instruction::BYTE
	};
	checkCSE(input, {u256(0xff), Instruction::CALLVALUE, Instruction::AND});
}

BOOST_AUTO_TEST_CASE(cse_storage)
{
	AssemblyItems input{
		u256(0),
		Instruction::SLOAD,
		u256(0),
		Instruction::SLOAD,
		Instruction::ADD,
		u256(0),
		Instruction::SSTORE
	};
	/* Upstream code does this
	checkCSE(input, {
		u256(0),
		Instruction::DUP1,
		Instruction::SLOAD,
		Instruction::DUP1,
		Instruction::ADD,
		Instruction::SWAP1,
		Instruction::SSTORE
	});
	*/

	// With Seismic Solidity SLOAD having side effects, CSE cannot optimize across SLOADs,
	// so we use checkFullCSE which handles CSE stopping at side-effect instructions,
	// to at least do constant folding.
	checkFullCSE(input, {
		u256(0),
		Instruction::SLOAD,
		u256(0),
		Instruction::SLOAD,
		Instruction::ADD,
		u256(0),
		Instruction::SSTORE
	});
}
BOOST_AUTO_TEST_CASE(shielded_cse_storage)
{
	AssemblyItems input{
		u256(0),
		Instruction::CLOAD,
		u256(0),
		Instruction::CLOAD,
		Instruction::ADD,
		u256(0),
		Instruction::CSTORE
	};
	checkCSE(input, {
		u256(0),
		Instruction::DUP1,
		Instruction::CLOAD,
		Instruction::DUP1,
		Instruction::ADD,
		Instruction::SWAP1,
		Instruction::CSTORE
	});
}

BOOST_AUTO_TEST_CASE(cse_noninterleaved_storage)
{
	// two stores to the same location should be replaced by only one store, even if we
	// read in the meantime
	AssemblyItems input{
		u256(7),
		Instruction::DUP2,
		Instruction::SSTORE,
		Instruction::DUP1,
		Instruction::SLOAD,
		u256(8),
		Instruction::DUP3,
		Instruction::SSTORE
	};
	/* Upstream code does this
	checkCSE(input, {
		u256(8),
		Instruction::DUP2,
		Instruction::SSTORE,
		u256(7)
	});
	*/

	// With SLOAD having side effects, CSE cannot optimize across it
	checkFullCSE(input, input);
}

BOOST_AUTO_TEST_CASE(shielded_cse_noninterleaved_storage)
{
	// two stores to the same location should be replaced by only one store, even if we
	// read in the meantime
	AssemblyItems input{
		u256(7),
		Instruction::DUP2,
		Instruction::CSTORE,
		Instruction::DUP1,
		Instruction::CLOAD,
		u256(8),
		Instruction::DUP3,
		Instruction::CSTORE
	};
	checkCSE(input, {
		u256(8),
		Instruction::DUP2,
		Instruction::CSTORE,
		u256(7)
	});
}

BOOST_AUTO_TEST_CASE(cse_interleaved_storage)
{
	// stores and reads to/from two unknown locations, should not optimize away the first store
	AssemblyItems input{
		u256(7),
		Instruction::DUP2,
		Instruction::SSTORE, // store to "DUP1"
		Instruction::DUP2,
		Instruction::SLOAD, // read from "DUP2", might be equal to "DUP1"
		u256(0),
		Instruction::DUP3,
		Instruction::SSTORE // store different value to "DUP1"
	};
	/* Upstream code does this
	checkCSE(input, input);
	*/
	// Seismic Solidity requires FullCSE since SLOAD has side effects
	checkFullCSE(input, input);
}

BOOST_AUTO_TEST_CASE(shielded_cse_interleaved_storage)
{
	// stores and reads to/from two unknown locations, should not optimize away the first store
	AssemblyItems input{
		u256(7),
		Instruction::DUP2,
		Instruction::CSTORE, // store to "DUP1"
		Instruction::DUP2,
		Instruction::CLOAD, // read from "DUP2", might be equal to "DUP1"
		u256(0),
		Instruction::DUP3,
		Instruction::CSTORE
	};
	checkCSE(input, input);
}

BOOST_AUTO_TEST_CASE(cse_interleaved_storage_same_value)
{
	// stores and reads to/from two unknown locations, should not optimize away the first store
	// but it should optimize away the second, since we already know the value will be the same
	AssemblyItems input{
		u256(7),
		Instruction::DUP2,
		Instruction::SSTORE, // store to "DUP1"
		Instruction::DUP2,
		Instruction::SLOAD, // read from "DUP2", might be equal to "DUP1"
		u256(6),
		u256(1),
		Instruction::ADD,
		Instruction::DUP3,
		Instruction::SSTORE // store same value to "DUP1"
	};
	/* Upstream code does this
	checkCSE(input, {
		u256(7),
		Instruction::DUP2,
		Instruction::SSTORE,
		Instruction::DUP2,
		Instruction::SLOAD
	});
	*/

	// With SLOAD having side effects, CSE cannot optimize across it.
	// But constant folding still happens (6 + 1 = 7).
	checkFullCSE(input, {
		u256(7),
		Instruction::DUP2,
		Instruction::SSTORE,
		Instruction::DUP2,
		Instruction::SLOAD,
		u256(7),
		Instruction::DUP3,
		Instruction::SSTORE
	});
}

BOOST_AUTO_TEST_CASE(shielded_cse_interleaved_storage_same_value)
{
	// stores and reads to/from two unknown locations, should not optimize away the first store
	// but it should optimize away the second, since we already know the value will be the same
	AssemblyItems input{
		u256(7),
		Instruction::DUP2,
		Instruction::CSTORE, // store to "DUP1"
		Instruction::DUP2,
		Instruction::CLOAD, // read from "DUP2", might be equal to "DUP1"
		u256(6),
		u256(1),
		Instruction::ADD,
		Instruction::DUP3,
		Instruction::CSTORE // store same value to "DUP1"
	};
	checkCSE(input, {
		u256(7),
		Instruction::DUP2,
		Instruction::CSTORE,
		Instruction::DUP2,
		Instruction::CLOAD
	});
}

BOOST_AUTO_TEST_CASE(cse_interleaved_storage_at_known_location)
{
	// stores and reads to/from two known locations, should optimize away the first store,
	// because we know that the location is different
	AssemblyItems input{
		u256(0x70),
		u256(1),
		Instruction::SSTORE, // store to 1
		u256(2),
		Instruction::SLOAD, // read from 2, is different from 1
		u256(0x90),
		u256(1),
		Instruction::SSTORE // store different value at 1
	};
	/* Upstream code does this
	checkCSE(input, {
		u256(2),
		Instruction::SLOAD,
		u256(0x90),
		u256(1),
		Instruction::SSTORE
	});
	*/

	// With SLOAD having side effects, CSE cannot optimize across it
	checkFullCSE(input, input);
}

BOOST_AUTO_TEST_CASE(shielded_cse_interleaved_storage_at_known_location)
{
	// stores and reads to/from two known locations, should optimize away the first store,
	// because we know that the location is different
	AssemblyItems input{
		u256(0x70),
		u256(1),
		Instruction::CSTORE, // store to 1
		u256(2),
		Instruction::CLOAD, // read from 2, is different from 1
		u256(0x90),
		u256(1),
		Instruction::CSTORE // store different value at 1
	};
	checkCSE(input, {
		u256(2),
		Instruction::CLOAD,
		u256(0x90),
		u256(1),
		Instruction::CSTORE
	});
}

BOOST_AUTO_TEST_CASE(cse_interleaved_storage_at_known_location_offset)
{
	// stores and reads to/from two locations which are known to be different,
	// should optimize away the first store, because we know that the location is different
	AssemblyItems input{
		u256(0x70),
		Instruction::DUP2,
		u256(1),
		Instruction::ADD,
		Instruction::SSTORE, // store to "DUP1"+1
		Instruction::DUP1,
		u256(2),
		Instruction::ADD,
		Instruction::SLOAD, // read from "DUP1"+2, is different from "DUP1"+1
		u256(0x90),
		Instruction::DUP3,
		u256(1),
		Instruction::ADD,
		Instruction::SSTORE // store different value at "DUP1"+1
	};
	/* Upstream code does this
	checkCSE(input, {
		u256(2),
		Instruction::DUP2,
		Instruction::ADD,
		Instruction::SLOAD,
		u256(0x90),
		u256(1),
		Instruction::DUP4,
		Instruction::ADD,
		Instruction::SSTORE
	});
	*/

	// With SLOAD having side effects, CSE cannot optimize across it
	checkFullCSE(input, input);
}

BOOST_AUTO_TEST_CASE(shielded_cse_interleaved_storage_at_known_location_offset)
{
	// stores and reads to/from two locations which are known to be different,
	// should optimize away the first store, because we know that the location is different
	AssemblyItems input{
		u256(0x70),
		Instruction::DUP2,
		u256(1),
		Instruction::ADD,
		Instruction::CSTORE, // store to "DUP1"+1
		Instruction::DUP1,
		u256(2),
		Instruction::ADD,
		Instruction::CLOAD, // read from "DUP1"+2, is different from "DUP1"+1
		u256(0x90),
		Instruction::DUP3,
		u256(1),
		Instruction::ADD,
		Instruction::CSTORE // store different value at "DUP1"+1
	};
	checkCSE(input, {
		u256(2),
		Instruction::DUP2,
		Instruction::ADD,
		Instruction::CLOAD,
		u256(0x90),
		u256(1),
		Instruction::DUP4,
		Instruction::ADD,
		Instruction::CSTORE
	});
}

BOOST_AUTO_TEST_CASE(cse_deep_stack)
{
	AssemblyItems input{
		Instruction::ADD,
		Instruction::SWAP1,
		Instruction::POP,
		Instruction::SWAP8,
		Instruction::POP,
		Instruction::SWAP8,
		Instruction::POP,
		Instruction::SWAP8,
		Instruction::SWAP5,
		Instruction::POP,
		Instruction::POP,
		Instruction::POP,
		Instruction::POP,
		Instruction::POP,
	};
	checkCSE(input, {
		Instruction::SWAP4,
		Instruction::SWAP12,
		Instruction::SWAP3,
		Instruction::SWAP11,
		Instruction::POP,
		Instruction::SWAP1,
		Instruction::SWAP3,
		Instruction::ADD,
		Instruction::SWAP8,
		Instruction::POP,
		Instruction::SWAP6,
		Instruction::POP,
		Instruction::POP,
		Instruction::POP,
		Instruction::POP,
		Instruction::POP,
		Instruction::POP,
	});
}

BOOST_AUTO_TEST_CASE(cse_jumpi_no_jump)
{
	AssemblyItems input{
		u256(0),
		u256(1),
		Instruction::DUP2,
		AssemblyItem(PushTag, 1),
		Instruction::JUMPI
	};
	checkCSE(input, {
		u256(0),
		u256(1)
	});
}

BOOST_AUTO_TEST_CASE(cse_jumpi_jump)
{
	AssemblyItems input{
		u256(1),
		u256(1),
		Instruction::DUP2,
		AssemblyItem(PushTag, 1),
		Instruction::JUMPI
	};
	checkCSE(input, {
		u256(1),
		Instruction::DUP1,
		AssemblyItem(PushTag, 1),
		Instruction::JUMP
	});
}

BOOST_AUTO_TEST_CASE(cse_empty_keccak256)
{
	AssemblyItems input{
		u256(0),
		Instruction::DUP2,
		Instruction::KECCAK256
	};
	checkCSE(input, {
		u256(util::keccak256(bytesConstRef()))
	});
}

BOOST_AUTO_TEST_CASE(cse_partial_keccak256)
{
	AssemblyItems input{
		u256(0xabcd) << (256 - 16),
		u256(0),
		Instruction::MSTORE,
		u256(2),
		u256(0),
		Instruction::KECCAK256
	};
	checkCSE(input, {
		u256(0xabcd) << (256 - 16),
		u256(0),
		Instruction::MSTORE,
		u256(util::keccak256(bytes{0xab, 0xcd}))
	});
}

BOOST_AUTO_TEST_CASE(cse_keccak256_twice_same_location)
{
	// Keccak-256 twice from same dynamic location
	AssemblyItems input{
		Instruction::DUP2,
		Instruction::DUP1,
		Instruction::MSTORE,
		u256(64),
		Instruction::DUP2,
		Instruction::KECCAK256,
		u256(64),
		Instruction::DUP3,
		Instruction::KECCAK256
	};
	checkCSE(input, {
		Instruction::DUP2,
		Instruction::DUP1,
		Instruction::MSTORE,
		u256(64),
		Instruction::DUP2,
		Instruction::KECCAK256,
		Instruction::DUP1
	});
}

BOOST_AUTO_TEST_CASE(cse_keccak256_twice_same_content)
{
	// Keccak-256 twice from different dynamic location but with same content
	AssemblyItems input{
		Instruction::DUP1,
		u256(0x80),
		Instruction::MSTORE, // m[128] = DUP1
		u256(0x20),
		u256(0x80),
		Instruction::KECCAK256, // keccak256(m[128..(128+32)])
		Instruction::DUP2,
		u256(12),
		Instruction::MSTORE, // m[12] = DUP1
		u256(0x20),
		u256(12),
		Instruction::KECCAK256 // keccak256(m[12..(12+32)])
	};
	checkCSE(input, {
		u256(0x80),
		Instruction::DUP2,
		Instruction::DUP2,
		Instruction::MSTORE,
		u256(0x20),
		Instruction::SWAP1,
		Instruction::KECCAK256,
		u256(12),
		Instruction::DUP3,
		Instruction::SWAP1,
		Instruction::MSTORE,
		Instruction::DUP1
	});
}

BOOST_AUTO_TEST_CASE(cse_keccak256_twice_same_content_dynamic_store_in_between)
{
	// Keccak-256 twice from different dynamic location but with same content,
	// dynamic mstore in between, which forces us to re-calculate the hash
	AssemblyItems input{
		u256(0x80),
		Instruction::DUP2,
		Instruction::DUP2,
		Instruction::MSTORE, // m[128] = DUP1
		u256(0x20),
		Instruction::DUP1,
		Instruction::DUP3,
		Instruction::KECCAK256, // keccak256(m[128..(128+32)])
		u256(12),
		Instruction::DUP5,
		Instruction::DUP2,
		Instruction::MSTORE, // m[12] = DUP1
		Instruction::DUP12,
		Instruction::DUP14,
		Instruction::MSTORE, // destroys memory knowledge
		Instruction::SWAP2,
		Instruction::SWAP1,
		Instruction::SWAP2,
		Instruction::KECCAK256 // keccak256(m[12..(12+32)])
	};
	checkCSE(input, input);
}

BOOST_AUTO_TEST_CASE(cse_keccak256_twice_same_content_noninterfering_store_in_between)
{
	// Keccak-256 twice from different dynamic location but with same content,
	// dynamic mstore in between, but does not force us to re-calculate the hash
	AssemblyItems input{
		u256(0x80),
		Instruction::DUP2,
		Instruction::DUP2,
		Instruction::MSTORE, // m[128] = DUP1
		u256(0x20),
		Instruction::DUP1,
		Instruction::DUP3,
		Instruction::KECCAK256, // keccak256(m[128..(128+32)])
		u256(12),
		Instruction::DUP5,
		Instruction::DUP2,
		Instruction::MSTORE, // m[12] = DUP1
		Instruction::DUP12,
		u256(12 + 32),
		Instruction::MSTORE, // does not destroy memory knowledge
		Instruction::DUP13,
		u256(128 - 32),
		Instruction::MSTORE, // does not destroy memory knowledge
		u256(0x20),
		u256(12),
		Instruction::KECCAK256 // keccak256(m[12..(12+32)])
	};
	// if this changes too often, only count the number of SHA3 and MSTORE instructions
	AssemblyItems output = CSE(input);
	BOOST_CHECK_EQUAL(4, count(output.begin(), output.end(), AssemblyItem(Instruction::MSTORE)));
	BOOST_CHECK_EQUAL(1, count(output.begin(), output.end(), AssemblyItem(Instruction::KECCAK256)));
}

BOOST_AUTO_TEST_CASE(cse_with_initially_known_stack)
{
	evmasm::KnownState state = createInitialState(AssemblyItems{
		u256(0x12),
		u256(0x20),
		Instruction::ADD
	});
	AssemblyItems input{
		u256(0x12 + 0x20)
	};
	checkCSE(input, AssemblyItems{Instruction::DUP1}, state);
}

BOOST_AUTO_TEST_CASE(cse_equality_on_initially_known_stack)
{
	evmasm::KnownState state = createInitialState(AssemblyItems{Instruction::DUP1});
	AssemblyItems input{
		Instruction::EQ
	};
	AssemblyItems output = CSE(input, state);
	// check that it directly pushes 1 (true)
	BOOST_CHECK(find(output.begin(), output.end(), AssemblyItem(u256(1))) != output.end());
}

// Commenting out this test, but keeping here for documenting how seismic solidity semantics
// differ from normal solidity. Because SLOAD has side effects, StackTooDeepException on
// sequence access simply can't occur anymore because CSE stops at SLOAD before
// it can try to access previous sequences.
BOOST_AUTO_TEST_CASE(cse_access_previous_sequence)
{
	// Tests that the code generator detects whether it tries to access SLOAD instructions
	// from a sequenced expression which is not in its scope.
	evmasm::KnownState state = createInitialState(AssemblyItems{
		u256(0),
		Instruction::SLOAD,
		u256(1),
		Instruction::ADD,
		u256(0),
		Instruction::SSTORE
	});
	// now stored: val_1 + 1 (value at sequence 1)
	// if in the following instructions, the SLOAD cresolves to "val_1 + 1",
	// this cannot be generated because we cannot load from sequence 1 anymore.
	AssemblyItems input{
		u256(0),
		Instruction::SLOAD,
	};
	// BOOST_CHECK_THROW(CSE(input, state), StackTooDeepException);
	// @todo for now, this throws an exception, but it should recover to the following
	// (or an even better version) at some point:
	// 0, SLOAD, 1, ADD, SSTORE, 0 SLOAD
}

BOOST_AUTO_TEST_CASE(shielded_cse_access_previous_sequence)
{
	// Tests that the code generator detects whether it tries to access CLOAD instructions
	// from a sequenced expression which is not in its scope.
	evmasm::KnownState state = createInitialState(AssemblyItems{
		u256(0),
		Instruction::CLOAD,
		u256(1),
		Instruction::ADD,
		u256(0),
		Instruction::CSTORE
	});
	// now stored: val_1 + 1 (value at sequence 1)
	// if in the following instructions, the CLOAD cresolves to "val_1 + 1",
	// this cannot be generated because we cannot load from sequence 1 anymore.
	AssemblyItems input{
		u256(0),
		Instruction::CLOAD,
	};
	BOOST_CHECK_THROW(CSE(input, state), StackTooDeepException);
	// @todo for now, this throws an exception, but it should recover to the following
	// (or an even better version) at some point:
	// 0, CLOAD, 1, ADD, CSTORE, 0 CLOAD
}

BOOST_AUTO_TEST_CASE(cse_optimise_return)
{
	checkCSE(
		AssemblyItems{u256(0), u256(7), Instruction::RETURN},
		AssemblyItems{Instruction::STOP}
	);
}

BOOST_AUTO_TEST_CASE(control_flow_graph_remove_unused)
{
	// remove parts of the code that are unused
	AssemblyItems input{
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		u256(7),
		AssemblyItem(Tag, 1),
	};
	checkCFG(input, {});
}

BOOST_AUTO_TEST_CASE(control_flow_graph_remove_unused_loop)
{
	AssemblyItems input{
		AssemblyItem(PushTag, 3),
		Instruction::JUMP,
		AssemblyItem(Tag, 1),
		u256(7),
		AssemblyItem(PushTag, 2),
		Instruction::JUMP,
		AssemblyItem(Tag, 2),
		u256(8),
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		AssemblyItem(Tag, 3),
		u256(11)
	};
	checkCFG(input, {u256(11)});
}

BOOST_AUTO_TEST_CASE(control_flow_graph_reconnect_single_jump_source)
{
	// move code that has only one unconditional jump source
	AssemblyItems input{
		u256(1),
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		AssemblyItem(Tag, 2),
		u256(2),
		AssemblyItem(PushTag, 3),
		Instruction::JUMP,
		AssemblyItem(Tag, 1),
		u256(3),
		AssemblyItem(PushTag, 2),
		Instruction::JUMP,
		AssemblyItem(Tag, 3),
		u256(4),
	};
	checkCFG(input, {u256(1), u256(3), u256(2), u256(4)});
}

BOOST_AUTO_TEST_CASE(control_flow_graph_do_not_remove_returned_to)
{
	// do not remove parts that are "returned to"
	AssemblyItems input{
		AssemblyItem(PushTag, 1),
		AssemblyItem(PushTag, 2),
		Instruction::JUMP,
		AssemblyItem(Tag, 2),
		Instruction::JUMP,
		AssemblyItem(Tag, 1),
		u256(2)
	};
	checkCFG(input, {u256(2)});
}

BOOST_AUTO_TEST_CASE(block_deduplicator)
{
	AssemblyItems input{
		AssemblyItem(PushTag, 2),
		AssemblyItem(PushTag, 1),
		AssemblyItem(PushTag, 3),
		u256(6),
		Instruction::SWAP3,
		Instruction::JUMP,
		AssemblyItem(Tag, 1),
		u256(6),
		Instruction::SWAP3,
		Instruction::JUMP,
		AssemblyItem(Tag, 2),
		u256(6),
		Instruction::SWAP3,
		Instruction::JUMP,
		AssemblyItem(Tag, 3)
	};
	BlockDeduplicator deduplicator(input);
	deduplicator.deduplicate();

	std::set<u256> pushTags;
	for (AssemblyItem const& item: input)
		if (item.type() == PushTag)
			pushTags.insert(item.data());
	BOOST_CHECK_EQUAL(pushTags.size(), 2);
}

BOOST_AUTO_TEST_CASE(block_deduplicator_assign_immutable_same)
{
	AssemblyItems blocks{
		AssemblyItem(Tag, 1),
		u256(42),
		AssemblyItem{AssignImmutable, 0x1234},
		Instruction::JUMP,
		AssemblyItem(Tag, 2),
		u256(42),
		AssemblyItem{AssignImmutable, 0x1234},
		Instruction::JUMP
	};

	AssemblyItems input = AssemblyItems{
		AssemblyItem(PushTag, 2),
		AssemblyItem(PushTag, 1),
	} + blocks;
	AssemblyItems output = AssemblyItems{
		AssemblyItem(PushTag, 1),
		AssemblyItem(PushTag, 1),
	} + blocks;
	BlockDeduplicator deduplicator(input);
	deduplicator.deduplicate();
	BOOST_CHECK_EQUAL_COLLECTIONS(input.begin(), input.end(), output.begin(), output.end());
}

BOOST_AUTO_TEST_CASE(block_deduplicator_assign_immutable_different_value)
{
	AssemblyItems input{
		AssemblyItem(PushTag, 2),
		AssemblyItem(PushTag, 1),
		AssemblyItem(Tag, 1),
		u256(42),
		AssemblyItem{AssignImmutable, 0x1234},
		Instruction::JUMP,
		AssemblyItem(Tag, 2),
		u256(23),
		AssemblyItem{AssignImmutable, 0x1234},
		Instruction::JUMP
	};
	BlockDeduplicator deduplicator(input);
	BOOST_CHECK(!deduplicator.deduplicate());
}

BOOST_AUTO_TEST_CASE(block_deduplicator_assign_immutable_different_hash)
{
	AssemblyItems input{
		AssemblyItem(PushTag, 2),
		AssemblyItem(PushTag, 1),
		AssemblyItem(Tag, 1),
		u256(42),
		AssemblyItem{AssignImmutable, 0x1234},
		Instruction::JUMP,
		AssemblyItem(Tag, 2),
		u256(42),
		AssemblyItem{AssignImmutable, 0xABCD},
		Instruction::JUMP
	};
	BlockDeduplicator deduplicator(input);
	BOOST_CHECK(!deduplicator.deduplicate());
}

BOOST_AUTO_TEST_CASE(block_deduplicator_loops)
{
	AssemblyItems input{
		u256(0),
		Instruction::SLOAD,
		AssemblyItem(PushTag, 1),
		AssemblyItem(PushTag, 2),
		Instruction::JUMPI,
		Instruction::JUMP,
		AssemblyItem(Tag, 1),
		u256(5),
		u256(6),
		Instruction::SSTORE,
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		AssemblyItem(Tag, 2),
		u256(5),
		u256(6),
		Instruction::SSTORE,
		AssemblyItem(PushTag, 2),
		Instruction::JUMP,
	};
	BlockDeduplicator deduplicator(input);
	deduplicator.deduplicate();

	std::set<u256> pushTags;
	for (AssemblyItem const& item: input)
		if (item.type() == PushTag)
			pushTags.insert(item.data());
	BOOST_CHECK_EQUAL(pushTags.size(), 1);
}

BOOST_AUTO_TEST_CASE(shielded_block_deduplicator_loops)
{
	AssemblyItems input{
		u256(0),
		Instruction::CLOAD,
		AssemblyItem(PushTag, 1),
		AssemblyItem(PushTag, 2),
		Instruction::JUMPI,
		Instruction::JUMP,
		AssemblyItem(Tag, 1),
		u256(5),
		u256(6),
		Instruction::CSTORE,
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		AssemblyItem(Tag, 2),
		u256(5),
		u256(6),
		Instruction::CSTORE,
		AssemblyItem(PushTag, 2),
		Instruction::JUMP,
	};
	BlockDeduplicator deduplicator(input);
	deduplicator.deduplicate();

	std::set<u256> pushTags;
	for (AssemblyItem const& item: input)
		if (item.type() == PushTag)
			pushTags.insert(item.data());
	BOOST_CHECK_EQUAL(pushTags.size(), 1);
}

BOOST_AUTO_TEST_CASE(clear_unreachable_code)
{
	AssemblyItems items{
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		u256(0),
		Instruction::SLOAD,
		AssemblyItem(Tag, 2),
		u256(5),
		u256(6),
		Instruction::SSTORE,
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		u256(5),
		u256(6)
	};
	AssemblyItems expectation{
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		AssemblyItem(Tag, 2),
		u256(5),
		u256(6),
		Instruction::SSTORE,
		AssemblyItem(PushTag, 1),
		Instruction::JUMP
	};
	PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
	BOOST_REQUIRE(peepOpt.optimise());
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(shielded_clear_unreachable_code)
{
	AssemblyItems items{
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		u256(0),
		Instruction::CLOAD,
		AssemblyItem(Tag, 2),
		u256(5),
		u256(6),
		Instruction::CSTORE,
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		u256(5),
		u256(6)
	};
	AssemblyItems expectation{
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		AssemblyItem(Tag, 2),
		u256(5),
		u256(6),
		Instruction::CSTORE,
		AssemblyItem(PushTag, 1),
		Instruction::JUMP
	};

	PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
	BOOST_REQUIRE(peepOpt.optimise());
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(clear_unreachable_code_eof, *boost::unit_test::precondition(onEOF()))
{
	for (auto const& blockTerminatingItem:
		 {
			AssemblyItem::relativeJumpTo(AssemblyItem(Tag, 1)),
			AssemblyItem::jumpToFunction(1, 0, 0),
			AssemblyItem::functionReturn(),
			AssemblyItem::returnContract(0),
		}
 	)
	{
		AssemblyItems items{
			blockTerminatingItem,
			u256(0),
			Instruction::SLOAD,
			AssemblyItem(Tag, 2),
			u256(5),
			u256(6),
			Instruction::SSTORE,
			blockTerminatingItem,
			u256(5),
			u256(6)
		};
		AssemblyItems expectation{
			blockTerminatingItem,
			AssemblyItem(Tag, 2),
			u256(5),
			u256(6),
			Instruction::SSTORE,
			blockTerminatingItem,
		};
		PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
		BOOST_REQUIRE(peepOpt.optimise());
		BOOST_CHECK_EQUAL_COLLECTIONS(
			items.begin(), items.end(),
			expectation.begin(), expectation.end()
		);
	}
}

BOOST_AUTO_TEST_CASE(is_zero_is_zero_rjumpi, *boost::unit_test::precondition(onEOF()))
{
	AssemblyItems items{
		u256(1),
		Instruction::ISZERO,
		Instruction::ISZERO,
		AssemblyItem::conditionalRelativeJumpTo(AssemblyItem(Tag, 1)),
		u256(0),
		Instruction::SLOAD,
		AssemblyItem(Tag, 1),
	};

	AssemblyItems expectation{
		u256(1),
		AssemblyItem::conditionalRelativeJumpTo(AssemblyItem(Tag, 1)),
		u256(0),
		Instruction::SLOAD,
		AssemblyItem(Tag, 1),
	};

	PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
	BOOST_REQUIRE(peepOpt.optimise());
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(equal_is_zero_rjumpi, *boost::unit_test::precondition(onEOF()))
{
	AssemblyItems items{
		u256(1),
		u256(2),
		Instruction::EQ,
		Instruction::ISZERO,
		AssemblyItem::conditionalRelativeJumpTo(AssemblyItem(Tag, 1)),
		u256(0),
		Instruction::SLOAD,
		AssemblyItem(Tag, 1),
	};

	AssemblyItems expectation{
		u256(1),
		u256(2),
		Instruction::SUB,
		AssemblyItem::conditionalRelativeJumpTo(AssemblyItem(Tag, 1)),
		u256(0),
		Instruction::SLOAD,
		AssemblyItem(Tag, 1),
	};

	PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
	BOOST_REQUIRE(peepOpt.optimise());
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(double_rjump, *boost::unit_test::precondition(onEOF()))
{
	AssemblyItems items{
		u256(1),
		AssemblyItem::conditionalRelativeJumpTo(AssemblyItem(Tag, 1)),
		AssemblyItem::relativeJumpTo(AssemblyItem(Tag, 2)),
		AssemblyItem(Tag, 1),
		u256(0),
		Instruction::SLOAD,
		AssemblyItem(Tag, 2),
	};

	AssemblyItems expectation{
		u256(1),
		Instruction::ISZERO,
		AssemblyItem::conditionalRelativeJumpTo(AssemblyItem(Tag, 2)),
		AssemblyItem(Tag, 1),
		u256(0),
		Instruction::SLOAD,
		AssemblyItem(Tag, 2),
	};

	PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
	BOOST_REQUIRE(peepOpt.optimise());
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(rjump_to_next, *boost::unit_test::precondition(onEOF()))
{
	AssemblyItems items{
		AssemblyItem::relativeJumpTo(AssemblyItem(Tag, 1)),
		AssemblyItem(Tag, 1),
		u256(0),
		Instruction::SLOAD,
	};

	AssemblyItems expectation{
		AssemblyItem(Tag, 1),
		u256(0),
		Instruction::SLOAD,
	};

	PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
	BOOST_REQUIRE(peepOpt.optimise());
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(rjumpi_to_next, *boost::unit_test::precondition(onEOF()))
{
	AssemblyItems items{
		AssemblyItem::conditionalRelativeJumpTo(AssemblyItem(Tag, 1)),
		AssemblyItem(Tag, 1),
		u256(0),
		Instruction::SLOAD,
	};

	AssemblyItems expectation{
		Instruction::POP,
		AssemblyItem(Tag, 1),
		u256(0),
		Instruction::SLOAD,
	};

	PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
	BOOST_REQUIRE(peepOpt.optimise());
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(deduplicateNextTagBlockSize3)
{
	AssemblyItems items{
		Instruction::JUMP,
		u256(0),
		u256(1),
		Instruction::REVERT,
		AssemblyItem(Tag, 2),
		u256(0),
		u256(1),
		Instruction::REVERT
	};

	AssemblyItems expectation{
		Instruction::JUMP,
		AssemblyItem(Tag, 2),
		u256(0),
		u256(1),
		Instruction::REVERT
	};
	PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
	BOOST_REQUIRE(peepOpt.optimise());
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(deduplicateNextTagBlockSize2)
{
	AssemblyItems items{
		Instruction::JUMP,
		u256(0),
		Instruction::SELFDESTRUCT,
		AssemblyItem(Tag, 2),
		u256(0),
		Instruction::SELFDESTRUCT
	};

	AssemblyItems expectation{
		Instruction::JUMP,
		AssemblyItem(Tag, 2),
		u256(0),
		Instruction::SELFDESTRUCT
	};
	PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
	BOOST_REQUIRE(peepOpt.optimise());
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(deduplicateNextTagBlockSize1)
{
	AssemblyItems items{
		Instruction::JUMP,
		Instruction::STOP,
		AssemblyItem(Tag, 2),
		Instruction::STOP
	};

	AssemblyItems expectation{
		Instruction::JUMP,
		AssemblyItem(Tag, 2),
		Instruction::STOP
	};
	PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
	BOOST_REQUIRE(peepOpt.optimise());
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(peephole_double_push)
{
	AssemblyItems items{
		u256(0),
		u256(0),
		u256(5),
		u256(5),
		u256(4),
		u256(5)
	};
	AssemblyItems expectation{
		u256(0),
		Instruction::DUP1,
		u256(5),
		Instruction::DUP1,
		u256(4),
		u256(5)
	};

	// `PUSH0 PUSH0` is cheaper than `DUP1 PUSH0`
	if (solidity::test::CommonOptions::get().evmVersion() >= EVMVersion::shanghai())
		expectation = {
			u256(0),
			u256(0),
			u256(5),
			Instruction::DUP1,
			u256(4),
			u256(5)
		};

	PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
	BOOST_REQUIRE(peepOpt.optimise());
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(peephole_pop_calldatasize)
{
	AssemblyItems items{
		u256(4),
		Instruction::CALLDATASIZE,
		Instruction::LT,
		Instruction::POP
	};
	PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
	for (size_t i = 0; i < 3; i++)
		BOOST_CHECK(peepOpt.optimise());
	BOOST_CHECK(items.empty());
}

BOOST_AUTO_TEST_CASE(peephole_commutative_swap1)
{
	std::vector<Instruction> ops{
		Instruction::ADD,
		Instruction::MUL,
		Instruction::EQ,
		Instruction::AND,
		Instruction::OR,
		Instruction::XOR
	};
	for (Instruction const op: ops)
	{
		AssemblyItems items{
			u256(1),
			u256(2),
			Instruction::SWAP1,
			op,
			u256(4),
			u256(5)
		};
		AssemblyItems expectation{
			u256(1),
			u256(2),
			op,
			u256(4),
			u256(5)
		};
		PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
		BOOST_REQUIRE(peepOpt.optimise());
		BOOST_CHECK_EQUAL_COLLECTIONS(
			items.begin(), items.end(),
			expectation.begin(), expectation.end()
		);
	}
}

BOOST_AUTO_TEST_CASE(peephole_noncommutative_swap1)
{
	// NOTE: not comprehensive
	std::vector<Instruction> ops{
		Instruction::SUB,
		Instruction::DIV,
		Instruction::SDIV,
		Instruction::MOD,
		Instruction::SMOD,
		Instruction::EXP
	};
	for (Instruction const op: ops)
	{
		AssemblyItems items{
			u256(1),
			u256(2),
			Instruction::SWAP1,
			op,
			u256(4),
			u256(5)
		};
		AssemblyItems expectation{
			u256(1),
			u256(2),
			Instruction::SWAP1,
			op,
			u256(4),
			u256(5)
		};
		PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
		BOOST_REQUIRE(!peepOpt.optimise());
		BOOST_CHECK_EQUAL_COLLECTIONS(
			items.begin(), items.end(),
			expectation.begin(), expectation.end()
		);
	}
}

BOOST_AUTO_TEST_CASE(peephole_swap_comparison)
{
	std::map<Instruction, Instruction> swappableOps{
		{ Instruction::LT, Instruction::GT },
		{ Instruction::GT, Instruction::LT },
		{ Instruction::SLT, Instruction::SGT },
		{ Instruction::SGT, Instruction::SLT }
	};

	for (auto const& op: swappableOps)
	{
		AssemblyItems items{
			u256(1),
			u256(2),
			Instruction::SWAP1,
			op.first,
			u256(4),
			u256(5)
		};
		AssemblyItems expectation{
			u256(1),
			u256(2),
			op.second,
			u256(4),
			u256(5)
		};
		PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
		BOOST_REQUIRE(peepOpt.optimise());
		BOOST_CHECK_EQUAL_COLLECTIONS(
			items.begin(), items.end(),
			expectation.begin(), expectation.end()
		);
	}
}

BOOST_AUTO_TEST_CASE(peephole_truthy_and)
{
	AssemblyItems items{
		AssemblyItem(Tag, 1),
		Instruction::BALANCE,
		u256(0),
		Instruction::NOT,
		Instruction::AND,
		AssemblyItem(PushTag, 1),
		Instruction::JUMPI
	};
	AssemblyItems expectation{
		AssemblyItem(Tag, 1),
		Instruction::BALANCE,
		AssemblyItem(PushTag, 1),
		Instruction::JUMPI
	};
	PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
	BOOST_REQUIRE(peepOpt.optimise());
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}


BOOST_AUTO_TEST_CASE(peephole_iszero_iszero_jumpi)
{
	AssemblyItems items{
		AssemblyItem(Tag, 1),
		u256(0),
		Instruction::CALLDATALOAD,
		Instruction::ISZERO,
		Instruction::ISZERO,
		AssemblyItem(PushTag, 1),
		Instruction::JUMPI,
		u256(0),
		u256(0x20),
		Instruction::RETURN
	};
	AssemblyItems expectation{
		AssemblyItem(Tag, 1),
		u256(0),
		Instruction::CALLDATALOAD,
		AssemblyItem(PushTag, 1),
		Instruction::JUMPI,
		u256(0),
		u256(0x20),
		Instruction::RETURN
	};
	PeepholeOptimiser peepOpt(items, solidity::test::CommonOptions::get().evmVersion());
	BOOST_REQUIRE(peepOpt.optimise());
	BOOST_CHECK_EQUAL_COLLECTIONS(
	  items.begin(), items.end(),
	  expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(jumpdest_removal)
{
	AssemblyItems items{
		AssemblyItem(Tag, 2),
		AssemblyItem(PushTag, 1),
		u256(5),
		AssemblyItem(Tag, 10),
		AssemblyItem(Tag, 3),
		u256(6),
		AssemblyItem(Tag, 1),
		Instruction::JUMP,
	};
	AssemblyItems expectation{
		AssemblyItem(PushTag, 1),
		u256(5),
		u256(6),
		AssemblyItem(Tag, 1),
		Instruction::JUMP
	};
	JumpdestRemover jdr(items);
	BOOST_REQUIRE(jdr.optimise({}));
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(jumpdest_removal_subassemblies, *boost::unit_test::precondition(nonEOF()))
{
	// This tests that tags from subassemblies are not removed
	// if they are referenced by a super-assembly. Furthermore,
	// tag unifications (due to block deduplication) is also
	// visible at the super-assembly.

	solAssert(!solidity::test::CommonOptions::get().eofVersion().has_value());
	Assembly::OptimiserSettings settings;
	settings.runInliner = false;
	settings.runJumpdestRemover = true;
	settings.runPeephole = true;
	settings.runDeduplicate = true;
	settings.runCSE = true;
	settings.runConstantOptimiser = true;
	settings.expectedExecutionsPerDeployment = OptimiserSettings{}.expectedExecutionsPerDeployment;

	auto const evmVersion = CommonOptions::get().evmVersion();
	Assembly main{evmVersion, false, std::nullopt, {}};
	AssemblyPointer sub = std::make_shared<Assembly>(evmVersion, true, std::nullopt, std::string{});

	sub->append(u256(1));
	auto t1 = sub->newTag();
	sub->append(t1);
	sub->append(u256(2));
	sub->append(Instruction::JUMP);
	auto t2 = sub->newTag();
	sub->append(t2); // Identical to T1, will be unified
	sub->append(u256(2));
	sub->append(Instruction::JUMP);
	auto t3 = sub->newTag();
	sub->append(t3);
	auto t4 = sub->newTag();
	sub->append(t4);
	auto t5 = sub->newTag();
	sub->append(t5); // This will be removed
	sub->append(u256(7));
	sub->append(t4.pushTag());
	sub->append(Instruction::JUMP);

	SubAssemblyID subId{main.appendSubroutine(sub).data()};
	main.append(t1.toSubAssemblyTag(subId));
	main.append(t1.toSubAssemblyTag(subId));
	main.append(u256(8));

	main.optimise(settings);

	AssemblyItems expectationMain{
		AssemblyItem(PushSubSize, 0),
		t1.toSubAssemblyTag(subId).pushTag(),
		t1.toSubAssemblyTag(subId).pushTag(),
		u256(8)
	};
	BOOST_REQUIRE(main.codeSections().size() == 1);
	BOOST_CHECK_EQUAL_COLLECTIONS(
		main.codeSections().at(0).items.begin(),main.codeSections().at(0).items.end(),
		expectationMain.begin(), expectationMain.end()
	);

	AssemblyItems expectationSub{
		u256(1), t1.tag(), u256(2), Instruction::JUMP, t4.tag(), u256(7), t4.pushTag(), Instruction::JUMP
	};
	BOOST_REQUIRE(sub->codeSections().size() == 1);
	BOOST_CHECK_EQUAL_COLLECTIONS(
		sub->codeSections().at(0).items.begin(), sub->codeSections().at(0).items.end(),
		expectationSub.begin(), expectationSub.end()
	);
}

BOOST_AUTO_TEST_CASE(cse_sub_zero)
{
	checkCSE({
		u256(0),
		Instruction::DUP2,
		Instruction::SUB
	}, {
		Instruction::DUP1
	});

	checkCSE({
		Instruction::DUP1,
		u256(0),
		Instruction::SUB
	}, {
		u256(0),
		Instruction::DUP2,
		Instruction::SWAP1,
		Instruction::SUB
	});
}

BOOST_AUTO_TEST_CASE(cse_simple_verbatim)
{
	auto verbatim = AssemblyItem{bytes{1, 2, 3, 4, 5}, 0, 0};
	AssemblyItems input{verbatim};
	checkCSE(input, input);
	checkFullCSE(input, input);
}

BOOST_AUTO_TEST_CASE(cse_mload_pop)
{
	AssemblyItems input{
		u256(1000),
		Instruction::MLOAD,
		Instruction::POP,
	};

	AssemblyItems output{
	};

	checkCSE(input, output);
	checkFullCSE(input, output);
}

BOOST_AUTO_TEST_CASE(cse_verbatim_mload)
{
	auto verbatim = AssemblyItem{bytes{1, 2, 3, 4, 5}, 0, 0};
	AssemblyItems input{
		u256(1000),
		Instruction::MLOAD, // Should not be removed
		Instruction::POP,
		verbatim,
		u256(1000),
		Instruction::MLOAD, // Should not be removed
		Instruction::POP,
	};

	checkFullCSE(input, input);
}

// SEISMIC NOTE: In Seismic Solidity, SLOAD has side effects (can revert on confidential storage access).
// Therefore two SLOADs from the same slot cannot be combined into one SLOAD + DUP.
// Note that this is generally not true since the only revert possible from an SLOAD is from attempting
// to read from a confidential slot, so reading the same slot twice should be optimizable.
// However we have not implemented such an analysis yet, so we conservatively assume SLOAD has generic side effects.
BOOST_AUTO_TEST_CASE(cse_sload_verbatim_dup)
{
	auto verbatim = AssemblyItem{bytes{1, 2, 3, 4, 5}, 0, 0};
	AssemblyItems input{
		u256(0),
		Instruction::SLOAD,
		u256(0),
		Instruction::SLOAD,
		verbatim
	};

	/* Upstream code does this
	AssemblyItems output{
		u256(0),
		Instruction::SLOAD,
		Instruction::DUP1,
		verbatim
	};

	checkCSE(input, output);
	checkFullCSE(input, output);
	*/
	// With SLOAD having side effects, the two SLOADs cannot be combined
	checkFullCSE(input, input);
}

BOOST_AUTO_TEST_CASE(shielded_cse_sload_verbatim_dup)
{
	auto verbatim = AssemblyItem{bytes{1, 2, 3, 4, 5}, 0, 0};
	AssemblyItems input{
		u256(0),
		Instruction::CLOAD,
		u256(0),
		Instruction::CLOAD,
		verbatim
	};

	AssemblyItems output{
		u256(0),
		Instruction::CLOAD,
		Instruction::DUP1,
		verbatim
	};

	checkCSE(input, output);
	checkFullCSE(input, output);
}


BOOST_AUTO_TEST_CASE(cse_verbatim_sload_sideeffect)
{
	auto verbatim = AssemblyItem{bytes{1, 2, 3, 4, 5}, 0, 0};
	AssemblyItems input{
		u256(0),
		Instruction::SLOAD,
		verbatim,
		u256(0),
		Instruction::SLOAD,
	};

	checkFullCSE(input, input);
}

BOOST_AUTO_TEST_CASE(shielded_cse_verbatim_sload_sideeffect)
{
	auto verbatim = AssemblyItem{bytes{1, 2, 3, 4, 5}, 0, 0};
	AssemblyItems input{
		u256(0),
		Instruction::CLOAD,
		verbatim,
		u256(0),
		Instruction::CLOAD,
	};

	checkFullCSE(input, input);
}

BOOST_AUTO_TEST_CASE(cse_verbatim_eq)
{
	auto verbatim = AssemblyItem{bytes{1, 2, 3, 4, 5}, 0, 0};
	AssemblyItems input{
		u256(0),
		Instruction::SLOAD,
		verbatim,
		Instruction::DUP1,
		Instruction::EQ
	};

	checkFullCSE(input, input);
}

BOOST_AUTO_TEST_CASE(shielded_cse_verbatim_eq)
{
	auto verbatim = AssemblyItem{bytes{1, 2, 3, 4, 5}, 0, 0};
	AssemblyItems input{
		u256(0),
		Instruction::CLOAD,
		verbatim,
		Instruction::DUP1,
		Instruction::EQ
	};

	checkFullCSE(input, input);
}

BOOST_AUTO_TEST_CASE(verbatim_knownstate)
{
	KnownState state = createInitialState(AssemblyItems{
			Instruction::DUP1,
			Instruction::DUP2,
			Instruction::DUP3,
			Instruction::DUP4
		});
	std::map<int, unsigned> const& stackElements = state.stackElements();

	BOOST_CHECK(state.stackHeight() == 4);
	// One more than stack height because of the initial unknown element.
	BOOST_CHECK(stackElements.size() == 5);
	BOOST_CHECK(stackElements.count(0));
	unsigned initialElement = stackElements.at(0);
	// Check if all the DUPs were correctly matched to the same class.
	for (auto const& height: {1, 2, 3, 4})
		BOOST_CHECK(stackElements.at(height) == initialElement);

	auto verbatim2i5o = AssemblyItem{bytes{1, 2, 3, 4, 5}, 2, 5};
	state.feedItem(verbatim2i5o);

	BOOST_CHECK(state.stackHeight() == 7);
	// Stack elements
	// Before verbatim: {{0, x}, {1, x}, {2, x}, {3, x}, {4, x}}
	// After verbatim: {{0, x}, {1, x}, {2, x}, {3, a}, {4, b}, {5, c}, {6, d}, {7, e}}
	BOOST_CHECK(stackElements.size() == 8);

	for (auto const& height: {1, 2})
		BOOST_CHECK(stackElements.at(height) == initialElement);

	for (auto const& height: {3, 4, 5, 6, 7})
		BOOST_CHECK(stackElements.at(height) != initialElement);

	for (auto const& height1: {3, 4, 5, 6, 7})
		for (auto const& height2: {3, 4, 5, 6, 7})
			if (height1 < height2)
				BOOST_CHECK(stackElements.at(height1) != stackElements.at(height2));
}

BOOST_AUTO_TEST_CASE(cse_remove_redundant_shift_masking)
{
	if (!solidity::test::CommonOptions::get().evmVersion().hasBitwiseShifting())
		return;

	for (unsigned i = 1; i < 256; i++)
	{
		checkCSE({
			u256(boost::multiprecision::pow(u256(2), i) - 1),
			Instruction::CALLVALUE,
			u256(256-i),
			Instruction::SHR,
			Instruction::AND
		}, {
			Instruction::CALLVALUE,
			u256(256-i),
			Instruction::SHR,
		});

		checkCSE({
			Instruction::CALLVALUE,
			u256(256-i),
			Instruction::SHR,
			u256(boost::multiprecision::pow(u256(2), i)-1),
			Instruction::AND
		}, {
			Instruction::CALLVALUE,
			u256(256-i),
			Instruction::SHR,
		});
	}

	// Check that opt. does NOT trigger
	for (unsigned i = 1; i < 255; i++)
	{
		checkCSE({
			u256(boost::multiprecision::pow(u256(2), i) - 1),
			Instruction::CALLVALUE,
			u256(255-i),
			Instruction::SHR,
			Instruction::AND
		}, { // Opt. did some reordering
			Instruction::CALLVALUE,
			u256(255-i),
			Instruction::SHR,
			u256(boost::multiprecision::pow(u256(2), i)-1),
			Instruction::AND
		});

		checkCSE({
			Instruction::CALLVALUE,
			u256(255-i),
			Instruction::SHR,
			u256(boost::multiprecision::pow(u256(2), i)-1),
			Instruction::AND
		}, { // Opt. did some reordering
			u256(boost::multiprecision::pow(u256(2), i)-1),
			Instruction::CALLVALUE,
			u256(255-i),
			Instruction::SHR,
			Instruction::AND
		});
	}

	//(x >> (31*8)) & 0xffffffff
	checkCSE({
		Instruction::CALLVALUE,
		u256(31*8),
		Instruction::SHR,
		u256(0xffffffff),
		Instruction::AND
	}, {
		Instruction::CALLVALUE,
		u256(31*8),
		Instruction::SHR
	});
}

BOOST_AUTO_TEST_CASE(cse_remove_unwanted_masking_of_address)
{
	std::vector<Instruction> ops{
		Instruction::ADDRESS,
		Instruction::CALLER,
		Instruction::ORIGIN,
		Instruction::COINBASE
	};
	for (auto const& op: ops)
	{
		checkCSE({
			u256("0xffffffffffffffffffffffffffffffffffffffff"),
			op,
			Instruction::AND
		}, {
			op
		});

		checkCSE({
			op,
			u256("0xffffffffffffffffffffffffffffffffffffffff"),
			Instruction::AND
		}, {
			op
		});

		// do not remove mask for other masking
		checkCSE({
			u256(1234),
			op,
			Instruction::AND
		}, {
			op,
			u256(1234),
			Instruction::AND
		});

		checkCSE({
			op,
			u256(1234),
			Instruction::AND
		}, {
			u256(1234),
			op,
			Instruction::AND
		});
	}

	// leave other opcodes untouched
	checkCSE({
		u256("0xffffffffffffffffffffffffffffffffffffffff"),
		Instruction::CALLVALUE,
		Instruction::AND
	}, {
		Instruction::CALLVALUE,
		u256("0xffffffffffffffffffffffffffffffffffffffff"),
		Instruction::AND
	});

	checkCSE({
		Instruction::CALLVALUE,
		u256("0xffffffffffffffffffffffffffffffffffffffff"),
		Instruction::AND
	}, {
		u256("0xffffffffffffffffffffffffffffffffffffffff"),
		Instruction::CALLVALUE,
		Instruction::AND
	});
}

BOOST_AUTO_TEST_CASE(cse_replace_too_large_shift)
{
	if (!solidity::test::CommonOptions::get().evmVersion().hasBitwiseShifting())
		return;

	checkCSE({
		Instruction::CALLVALUE,
		u256(299),
		Instruction::SHL
	}, {
		u256(0)
	});

	checkCSE({
		Instruction::CALLVALUE,
		u256(299),
		Instruction::SHR
	}, {
		u256(0)
	});

	checkCSE({
		Instruction::CALLVALUE,
		u256(255),
		Instruction::SHL
	}, {
		Instruction::CALLVALUE,
		u256(255),
		Instruction::SHL
	});

	checkCSE({
		Instruction::CALLVALUE,
		u256(255),
		Instruction::SHR
	}, {
		Instruction::CALLVALUE,
		u256(255),
		Instruction::SHR
	});
}

BOOST_AUTO_TEST_CASE(cse_dup)
{
	AssemblyItems input{
		u256(0),
		Instruction::DUP1,
		Instruction::REVERT
	};
	AssemblyItems output = input;

	checkCSE(input, output);
	checkFullCSE(input, output);
}

BOOST_AUTO_TEST_CASE(cse_push0)
{
	AssemblyItems input{
		u256(0),
		u256(0),
		Instruction::REVERT
	};
	AssemblyItems output{
		u256(0),
		Instruction::DUP1,
		Instruction::REVERT
	};
	// The CSE has a rule to replace with DUP1 PUSH0
	checkCSE(input, output);

	// The full handling by the compiler (Assembly::optimiseInternal)
	// will not choose to replace the pattern, because the new size is the same as the old one
	output = input;
	checkFullCSE(input, output);
}

BOOST_AUTO_TEST_CASE(inliner)
{
	AssemblyItem jumpInto{Instruction::JUMP};
	jumpInto.setJumpType(AssemblyItem::JumpType::IntoFunction);
	AssemblyItem jumpOutOf{Instruction::JUMP};
	jumpOutOf.setJumpType(AssemblyItem::JumpType::OutOfFunction);
	AssemblyItems items{
		AssemblyItem(PushTag, 1),
		AssemblyItem(PushTag, 2),
		jumpInto,
		AssemblyItem(Tag, 1),
		Instruction::STOP,
		AssemblyItem(Tag, 2),
		Instruction::CALLVALUE,
		Instruction::SWAP1,
		jumpOutOf,
	};
	AssemblyItems expectation{
		AssemblyItem(PushTag, 1),
		Instruction::CALLVALUE,
		Instruction::SWAP1,
		Instruction::JUMP,
		AssemblyItem(Tag, 1),
		Instruction::STOP,
		AssemblyItem(Tag, 2),
		Instruction::CALLVALUE,
		Instruction::SWAP1,
		jumpOutOf,
	};
	Inliner{items, {}, Assembly::OptimiserSettings{}.expectedExecutionsPerDeployment, false, {}}.optimise();
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}


BOOST_AUTO_TEST_CASE(inliner_no_inline_type)
{
	// Will not inline due to jump types.
	AssemblyItems items{
		AssemblyItem(PushTag, 1),
		AssemblyItem(PushTag, 2),
		Instruction::JUMP,
		AssemblyItem(Tag, 1),
		Instruction::STOP,
		AssemblyItem(Tag, 2),
		Instruction::CALLVALUE,
		Instruction::SWAP1,
		Instruction::JUMP,
	};
	Inliner{items, {}, Assembly::OptimiserSettings{}.expectedExecutionsPerDeployment, false, {}}.optimise();
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		items.begin(), items.end()
	);
}

BOOST_AUTO_TEST_CASE(inliner_no_inline)
{
	AssemblyItems items{
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		AssemblyItem(Tag, 1),
		Instruction::CALLVALUE,
		Instruction::JUMPI,
		Instruction::JUMP,
	};
	AssemblyItems expectation{
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		AssemblyItem(Tag, 1),
		Instruction::CALLVALUE,
		Instruction::JUMPI,
		Instruction::JUMP,
	};
	Inliner{items, {}, Assembly::OptimiserSettings{}.expectedExecutionsPerDeployment, false, {}}.optimise();
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}


BOOST_AUTO_TEST_CASE(inliner_single_jump)
{
	AssemblyItem jumpInto{Instruction::JUMP};
	jumpInto.setJumpType(AssemblyItem::JumpType::IntoFunction);
	AssemblyItem jumpOutOf{Instruction::JUMP};
	jumpOutOf.setJumpType(AssemblyItem::JumpType::OutOfFunction);
	AssemblyItems items{
		AssemblyItem(PushTag, 1),
		AssemblyItem(PushTag, 2),
		jumpInto,
		AssemblyItem(Tag, 1),
		Instruction::STOP,
		AssemblyItem(Tag, 2),
		jumpOutOf,
	};
	AssemblyItems expectation{
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		AssemblyItem(Tag, 1),
		Instruction::STOP,
		AssemblyItem(Tag, 2),
		jumpOutOf,
	};
	Inliner{items, {}, Assembly::OptimiserSettings{}.expectedExecutionsPerDeployment, false, {}}.optimise();
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(inliner_end_of_bytecode)
{
	AssemblyItem jumpInto{Instruction::JUMP};
	jumpInto.setJumpType(AssemblyItem::JumpType::IntoFunction);
	// Cannot inline, since the block at Tag_2 does not end in a jump.
	AssemblyItems items{
		AssemblyItem(PushTag, 1),
		AssemblyItem(PushTag, 2),
		jumpInto,
		AssemblyItem(Tag, 1),
		Instruction::STOP,
		AssemblyItem(Tag, 2),
	};
	Inliner{items, {}, Assembly::OptimiserSettings{}.expectedExecutionsPerDeployment, false, {}}.optimise();
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		items.begin(), items.end()
	);
}


BOOST_AUTO_TEST_CASE(inliner_cse_break)
{
	AssemblyItem jumpInto{Instruction::JUMP};
	jumpInto.setJumpType(AssemblyItem::JumpType::IntoFunction);
	AssemblyItem jumpOutOf{Instruction::JUMP};
	jumpOutOf.setJumpType(AssemblyItem::JumpType::OutOfFunction);
	// Could be inlined, but we only consider non-CSE-breaking blocks ending in JUMP so far.
	AssemblyItems items{
		AssemblyItem(PushTag, 1),
		AssemblyItem(PushTag, 2),
		jumpInto,
		AssemblyItem(Tag, 1),
		Instruction::STOP,
		AssemblyItem(Tag, 2),
		Instruction::STOP, // CSE breaking instruction
		jumpOutOf
	};
	Inliner{items, {}, Assembly::OptimiserSettings{}.expectedExecutionsPerDeployment, false, {}}.optimise();
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		items.begin(), items.end()
	);
}

BOOST_AUTO_TEST_CASE(inliner_stop)
{
	AssemblyItems items{
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		AssemblyItem(Tag, 1),
		Instruction::STOP
	};
	AssemblyItems expectation{
		Instruction::STOP,
		AssemblyItem(Tag, 1),
		Instruction::STOP
	};
	Inliner{items, {}, Assembly::OptimiserSettings{}.expectedExecutionsPerDeployment, false, {}}.optimise();
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(inliner_stop_jumpi)
{
	// Because of `jumpi`, will not be inlined.
	AssemblyItems items{
		u256(1),
		AssemblyItem(PushTag, 1),
		Instruction::JUMPI,
		AssemblyItem(Tag, 1),
		Instruction::STOP
	};
	AssemblyItems expectation = items;
	Inliner{items, {}, Assembly::OptimiserSettings{}.expectedExecutionsPerDeployment, false, {}}.optimise();
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(inliner_revert)
{
	AssemblyItems items{
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		AssemblyItem(Tag, 1),
		u256(0),
		Instruction::DUP1,
		Instruction::REVERT
	};
	AssemblyItems expectation{
		u256(0),
		Instruction::DUP1,
		Instruction::REVERT,
		AssemblyItem(Tag, 1),
		u256(0),
		Instruction::DUP1,
		Instruction::REVERT
	};

	Inliner{items, {}, Assembly::OptimiserSettings{}.expectedExecutionsPerDeployment, false, {}}.optimise();
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(inliner_revert_push0)
{
	// Inlining this without PUSH0 would increase data gas (5 bytes v/s 4 bytes), therefore, it would be skipped.
	// However, with PUSH0 it is inlined (3 bytes vs 4 bytes).
	AssemblyItems items{
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		AssemblyItem(Tag, 1),
		u256(0),
		u256(0),
		Instruction::REVERT
	};
	AssemblyItems expectation{
		u256(0),
		u256(0),
		Instruction::REVERT,
		AssemblyItem(Tag, 1),
		u256(0),
		u256(0),
		Instruction::REVERT
	};

	Inliner{items, {}, Assembly::OptimiserSettings{}.expectedExecutionsPerDeployment, false, {}}.optimise();
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}

BOOST_AUTO_TEST_CASE(inliner_invalid)
{
	AssemblyItems items{
		AssemblyItem(PushTag, 1),
		Instruction::JUMP,
		AssemblyItem(Tag, 1),
		Instruction::INVALID
	};

	AssemblyItems expectation = {
		Instruction::INVALID,
		AssemblyItem(Tag, 1),
		Instruction::INVALID
	};
	Inliner{items, {}, Assembly::OptimiserSettings{}.expectedExecutionsPerDeployment, false, {}}.optimise();
	BOOST_CHECK_EQUAL_COLLECTIONS(
		items.begin(), items.end(),
		expectation.begin(), expectation.end()
	);
}


BOOST_AUTO_TEST_CASE(cse_sstore_then_cload_can_optimize)
{
	AssemblyItems input{
		u256(0x42),
		u256(0),
		Instruction::SSTORE,
		u256(0),
		Instruction::CLOAD
	};
	// CLOAD can read from public storage, so optimizer eliminates CLOAD and keeps 0x42 on stack
	checkCSE(input, {
		u256(0x42),
		u256(0),
		Instruction::DUP2,
		Instruction::SWAP1,
		Instruction::SSTORE
	});
}

BOOST_AUTO_TEST_CASE(cse_cstore_then_sload_no_optimization)
{
	AssemblyItems input{
		u256(0x42),
		u256(0),
		Instruction::CSTORE,
		u256(0),
		Instruction::SLOAD
	};
	// Optimizer does stack manipulation but keeps SLOAD (doesn't replace with CSTORE value)
	checkCSE(input, {
		u256(0x42),
		u256(0),
		Instruction::SWAP1,
		Instruction::DUP2,
		Instruction::CSTORE,
		Instruction::SLOAD
	});
}

BOOST_AUTO_TEST_CASE(cse_sstore_cload_different_slots_no_optimization)
{
	AssemblyItems input{
		u256(0x42),
		u256(0),
		Instruction::SSTORE,
		u256(1),
		Instruction::CLOAD
	};
	checkCSE(input, input);
}

BOOST_AUTO_TEST_CASE(cse_cstore_sload_different_slots_no_optimization)
{
	AssemblyItems input{
		u256(0x42),
		u256(0),
		Instruction::CSTORE,
		u256(1),
		Instruction::SLOAD
	};
	checkCSE(input, input);
}

BOOST_AUTO_TEST_CASE(cse_sstore_sload_same_slot_can_optimize)
{
	AssemblyItems input{
		u256(0x42),
		u256(0),
		Instruction::SSTORE,
		u256(0),
		Instruction::SLOAD
	};
	/* Upstream code does this
	// Optimizer eliminates SLOAD and keeps value on stack
	checkCSE(input, {
		u256(0x42),
		u256(0),
		Instruction::DUP2,
		Instruction::SWAP1,
		Instruction::SSTORE
	});
	*/

	// In Seismic Solidity, with SLOAD having side effects, it cannot be eliminated
	checkFullCSE(input, input);
}

BOOST_AUTO_TEST_CASE(cse_cstore_cload_same_slot_can_optimize)
{
	AssemblyItems input{
		u256(0x42),
		u256(0),
		Instruction::CSTORE,
		u256(0),
		Instruction::CLOAD
	};
	// Optimizer eliminates CLOAD and keeps value on stack
	checkCSE(input, {
		u256(0x42),
		u256(0),
		Instruction::DUP2,
		Instruction::SWAP1,
		Instruction::CSTORE
	});
}

BOOST_AUTO_TEST_CASE(cse_p27_sstore_does_not_clobber_private_marker)
{
	// cstore(0, 0x11) claims slot 0 private. sstore(0, 0x22) would revert at
	// runtime — KnownState must not clobber the is_private=true marker, since
	// a subsequent CLOAD's cached value depends on it. Pre-fix the model sees
	// is_private=false after the SSTORE and a later CLOAD picks up 0x22 from
	// the cache; with the fix it stays 0x11.
	AssemblyItems input{
		u256(0x11),
		u256(0),
		Instruction::CSTORE,
		u256(0x22),
		u256(0),
		Instruction::SSTORE,
		u256(0),
		Instruction::CLOAD
	};
	// Post-fix: CLOAD eliminated, 0x11 (cstore value) left on stack via DUP.
	checkCSE(input, {
		u256(0x11),
		u256(0),
		Instruction::DUP2,
		Instruction::DUP2,
		Instruction::CSTORE,
		u256(0x22),
		Instruction::SWAP1,
		Instruction::SSTORE
	});
}

BOOST_AUTO_TEST_CASE(cse_cross_domain_cstore_sstore_cstore_preserves_all)
{
	// CSTORE privatizes slot 0, then SSTORE conflicts (should revert at runtime),
	// then another CSTORE writes to same slot. Without the fix, CSE drops the
	// first CSTORE, allowing the SSTORE to succeed and changing revert->success.
	AssemblyItems input{
		u256(0x11),
		u256(0),
		Instruction::CSTORE,
		u256(0),
		u256(0),
		Instruction::SSTORE,
		u256(0x33),
		u256(0),
		Instruction::CSTORE,
		u256(0),
		Instruction::CLOAD
	};
	AssemblyItems optimized = CSE(input);

	// Both CSTOREs and the SSTORE must be preserved — the cross-domain conflict
	// means eliminating any store changes the runtime semantics.
	BOOST_CHECK_EQUAL(countInstruction(optimized, Instruction::CSTORE), 2u);
	BOOST_CHECK_EQUAL(countInstruction(optimized, Instruction::SSTORE), 1u);
}

BOOST_AUTO_TEST_CASE(cse_cross_domain_sstore_cstore_sstore_preserves_all)
{
	// Reverse direction: SSTORE, then CSTORE, then SSTORE on same slot.
	// Without the fix, CSE drops the first SSTORE.
	AssemblyItems input{
		u256(0x11),
		u256(0),
		Instruction::SSTORE,
		u256(0x22),
		u256(0),
		Instruction::CSTORE,
		u256(0x33),
		u256(0),
		Instruction::SSTORE
	};
	AssemblyItems optimized = CSE(input);

	BOOST_CHECK_EQUAL(countInstruction(optimized, Instruction::SSTORE), 2u);
	BOOST_CHECK_EQUAL(countInstruction(optimized, Instruction::CSTORE), 1u);
}

BOOST_AUTO_TEST_CASE(cse_same_domain_duplicate_cstore_still_optimizes)
{
	// Two CSTOREs to the same slot with no cross-domain conflict —
	// normal CSE optimization should still eliminate the first one.
	AssemblyItems input{
		u256(0x11),
		u256(0),
		Instruction::CSTORE,
		u256(0x33),
		u256(0),
		Instruction::CSTORE
	};
	AssemblyItems optimized = CSE(input);

	// Only the last CSTORE should survive (normal same-domain optimization)
	BOOST_CHECK_EQUAL(countInstruction(optimized, Instruction::CSTORE), 1u);
}

BOOST_AUTO_TEST_SUITE_END()

} // end namespaces
