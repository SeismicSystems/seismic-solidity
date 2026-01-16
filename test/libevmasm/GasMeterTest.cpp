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
 * Unit tests for the gas meter for CLOAD/CSTORE opcodes.
 */

#include <libevmasm/GasMeter.h>
#include <libevmasm/KnownState.h>
#include <libevmasm/Instruction.h>

#include <boost/test/unit_test.hpp>

using namespace solidity::evmasm;
using namespace solidity::langutil;

namespace solidity::evmasm::test
{

BOOST_AUTO_TEST_SUITE(GasMeterTest)

BOOST_AUTO_TEST_CASE(cload_gas_cost)
{
	// Test that CLOAD has the expected fixed gas cost
	auto evmVersion = EVMVersion::mercury();
	auto state = std::make_shared<KnownState>();
	GasMeter meter(state, evmVersion);

	AssemblyItem cloadItem(Instruction::CLOAD);
	auto gas = meter.estimateMax(cloadItem, false);

	// CLOAD should cost coldSloadCost = 2100
	// BOOST_CHECK_EQUAL(gas.value, GasCosts::cloadGas);
	BOOST_CHECK_EQUAL(gas.value, 2100);
}

BOOST_AUTO_TEST_CASE(cstore_gas_cost_berlin)
{
	// Test that CSTORE has the expected fixed gas cost for Berlin+
	auto evmVersion = EVMVersion::mercury();
	auto state = std::make_shared<KnownState>();
	GasMeter meter(state, evmVersion);

	AssemblyItem cstoreItem(Instruction::CSTORE);
	auto gas = meter.estimateMax(cstoreItem, false);

	// CSTORE for Berlin+ should cost: warmStorageReadCost(100) + 20000 + coldSloadCost-warmStorageReadCost(2000)
	// = 100 + 20000 + 2000 = 22100
	// BOOST_CHECK_EQUAL(gas.value, GasCosts::cstoreGas(evmVersion));
	BOOST_CHECK_EQUAL(gas.value, 22100);
}

BOOST_AUTO_TEST_CASE(cstore_gas_cost_istanbul)
{
	// Test that CSTORE has the expected fixed gas cost for Istanbul
	auto evmVersion = EVMVersion::istanbul();
	auto state = std::make_shared<KnownState>();
	GasMeter meter(state, evmVersion);

	AssemblyItem cstoreItem(Instruction::CSTORE);
	auto gas = meter.estimateMax(cstoreItem, false);

	// CSTORE for Istanbul should cost: 800 + 20000 + 2000 = 22800
	// BOOST_CHECK_EQUAL(gas.value, GasCosts::cstoreGas(evmVersion));
	BOOST_CHECK_EQUAL(gas.value, 22800);
}

BOOST_AUTO_TEST_CASE(cload_cstore_sequence)
{
	// Test gas estimation for a sequence of CLOAD and CSTORE
	auto evmVersion = EVMVersion::mercury();
	auto state = std::make_shared<KnownState>();
	GasMeter meter(state, evmVersion);

	// Simulate: PUSH1 0, PUSH1 42, CSTORE, PUSH1 0, CLOAD
	AssemblyItem push1_0(Instruction::PUSH1);
	AssemblyItem push1_42(Instruction::PUSH1);
	AssemblyItem cstoreItem(Instruction::CSTORE);
	AssemblyItem cloadItem(Instruction::CLOAD);

	GasMeter::GasConsumption totalGas(0);
	totalGas += meter.estimateMax(push1_0, false);
	totalGas += meter.estimateMax(push1_42, false);
	totalGas += meter.estimateMax(cstoreItem, false);
	totalGas += meter.estimateMax(push1_0, false);
	totalGas += meter.estimateMax(cloadItem, false);

	// Should be: 3 + 3 + 22100 + 3 + 2100 = 24209
	BOOST_CHECK_EQUAL(totalGas.value, 24209);
}

BOOST_AUTO_TEST_CASE(cload_not_infinite)
{
	// Ensure CLOAD doesn't return infinite gas
	auto evmVersion = EVMVersion::mercury();
	auto state = std::make_shared<KnownState>();
	GasMeter meter(state, evmVersion);

	AssemblyItem cloadItem(Instruction::CLOAD);
	auto gas = meter.estimateMax(cloadItem, false);

	BOOST_CHECK(!gas.isInfinite);
}

BOOST_AUTO_TEST_CASE(cstore_not_infinite)
{
	// Ensure CSTORE doesn't return infinite gas
	auto evmVersion = EVMVersion::mercury();
	auto state = std::make_shared<KnownState>();
	GasMeter meter(state, evmVersion);

	AssemblyItem cstoreItem(Instruction::CSTORE);
	auto gas = meter.estimateMax(cstoreItem, false);

	BOOST_CHECK(!gas.isInfinite);
}

BOOST_AUTO_TEST_SUITE_END()

}
