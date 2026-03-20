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
 * @author Gav Wood <g@ethdev.com>
 * @date 2014
 * Container of the (implicit and explicit) global objects.
 */

#include <libsolidity/analysis/GlobalContext.h>

#include <libsolidity/ast/AST.h>
#include <libsolidity/ast/TypeProvider.h>
#include <libsolidity/ast/Types.h>
#include <memory>
#include <unordered_map>

namespace solidity::frontend
{

namespace
{

/// Magic variables get negative ids for easy differentiation
int magicVariableToID(std::string const& _name)
{
	static std::unordered_map<std::string, int> const magicVariables = {
		{"abi", -1},
		{"addmod", -2},
		{"assert", -3},
		{"block", -4},
		{"blockhash", -5},
		{"ecrecover", -6},
		{"gasleft", -7},
		{"keccak256", -8},
		{"msg", -15},
		{"mulmod", -16},
		{"now", -17},
		{"require", -18},
		{"revert", -19},
		{"ripemd160", -20},
		{"selfdestruct", -21},
		{"sha256", -22},
		{"sha3", -23},
		{"suicide", -24},
		{"super", -25},
		{"tx", -26},
		{"type", -27},
		{"this", -28},
		{"blobhash", -29},
		// Seismic-specific magic variables start at -100 to avoid collisions
		// with future upstream Solidity built-in IDs.
		{"ecdh", -100},
		{"aes_gcm_encrypt", -101},
		{"aes_gcm_decrypt", -102},
		{"hkdf", -103},
		{"secp256k1_sign", -104},
		// Seismic RNG bytes built-ins: unsafe_rng_bN at -(200+N).
		{"unsafe_rng_b1", -201},
		{"unsafe_rng_b2", -202},
		{"unsafe_rng_b3", -203},
		{"unsafe_rng_b4", -204},
		{"unsafe_rng_b5", -205},
		{"unsafe_rng_b6", -206},
		{"unsafe_rng_b7", -207},
		{"unsafe_rng_b8", -208},
		{"unsafe_rng_b9", -209},
		{"unsafe_rng_b10", -210},
		{"unsafe_rng_b11", -211},
		{"unsafe_rng_b12", -212},
		{"unsafe_rng_b13", -213},
		{"unsafe_rng_b14", -214},
		{"unsafe_rng_b15", -215},
		{"unsafe_rng_b16", -216},
		{"unsafe_rng_b17", -217},
		{"unsafe_rng_b18", -218},
		{"unsafe_rng_b19", -219},
		{"unsafe_rng_b20", -220},
		{"unsafe_rng_b21", -221},
		{"unsafe_rng_b22", -222},
		{"unsafe_rng_b23", -223},
		{"unsafe_rng_b24", -224},
		{"unsafe_rng_b25", -225},
		{"unsafe_rng_b26", -226},
		{"unsafe_rng_b27", -227},
		{"unsafe_rng_b28", -228},
		{"unsafe_rng_b29", -229},
		{"unsafe_rng_b30", -230},
		{"unsafe_rng_b31", -231},
		{"unsafe_rng_b32", -232},
		// Seismic RNG integer built-ins start at -233.
		{"unsafe_rng_u8", -233},
		{"unsafe_rng_u16", -234},
		{"unsafe_rng_u32", -235},
		{"unsafe_rng_u64", -236},
		{"unsafe_rng_u96", -237},
		{"unsafe_rng_u128", -238},
		{"unsafe_rng_u256", -239}
	};

	if (auto id = magicVariables.find(_name); id != magicVariables.end())
		return id->second;
	solAssert(false, "Unknown magic variable: \"" + _name + "\".");
}

inline std::vector<std::shared_ptr<MagicVariableDeclaration const>> constructMagicVariables(langutil::EVMVersion _evmVersion)
{
	static auto const magicVarDecl = [](std::string const& _name, Type const* _type) {
		return std::make_shared<MagicVariableDeclaration>(magicVariableToID(_name), _name, _type);
	};

	std::vector<std::shared_ptr<MagicVariableDeclaration const>> magicVariableDeclarations = {
		magicVarDecl("abi", TypeProvider::magic(MagicType::Kind::ABI)),
		magicVarDecl("addmod", TypeProvider::function(strings{"uint256", "uint256", "uint256"}, strings{"uint256"}, FunctionType::Kind::AddMod, StateMutability::Pure)),
		magicVarDecl("assert", TypeProvider::function(strings{"bool"}, strings{}, FunctionType::Kind::Assert, StateMutability::Pure)),
		magicVarDecl("block", TypeProvider::magic(MagicType::Kind::Block)),
		magicVarDecl("blockhash", TypeProvider::function(strings{"uint256"}, strings{"bytes32"}, FunctionType::Kind::BlockHash, StateMutability::View)),
		magicVarDecl("ecrecover", TypeProvider::function(strings{"bytes32", "uint8", "bytes32", "bytes32"}, strings{"address"}, FunctionType::Kind::ECRecover, StateMutability::Pure)),
		magicVarDecl("gasleft", TypeProvider::function(strings(), strings{"uint256"}, FunctionType::Kind::GasLeft, StateMutability::View)),
		magicVarDecl("keccak256", TypeProvider::function(strings{"bytes memory"}, strings{"bytes32"}, FunctionType::Kind::KECCAK256, StateMutability::Pure)),
		magicVarDecl("msg", TypeProvider::magic(MagicType::Kind::Message)),
		magicVarDecl("mulmod", TypeProvider::function(strings{"uint256", "uint256", "uint256"}, strings{"uint256"}, FunctionType::Kind::MulMod, StateMutability::Pure)),
		magicVarDecl("now", TypeProvider::uint256()),
		magicVarDecl("require", TypeProvider::function(strings{"bool"}, strings{}, FunctionType::Kind::Require, StateMutability::Pure)),
		magicVarDecl("require", TypeProvider::function(strings{"bool", "string memory"}, strings{}, FunctionType::Kind::Require, StateMutability::Pure)),
		magicVarDecl("require", TypeProvider::function(TypePointers{TypeProvider::boolean(), TypeProvider::magic(MagicType::Kind::Error)}, TypePointers{}, strings{2, ""}, strings{}, FunctionType::Kind::Require, StateMutability::Pure)),
		magicVarDecl("require", TypeProvider::function(strings{"sbool"}, strings{}, FunctionType::Kind::Require, StateMutability::Pure)),
		magicVarDecl("require", TypeProvider::function(strings{"sbool", "string memory"}, strings{}, FunctionType::Kind::Require, StateMutability::Pure)),
		magicVarDecl("require", TypeProvider::function(TypePointers{TypeProvider::shieldedBoolean(), TypeProvider::magic(MagicType::Kind::Error)}, TypePointers{}, strings{2, ""}, strings{}, FunctionType::Kind::Require, StateMutability::Pure)),
		magicVarDecl("revert", TypeProvider::function(strings(), strings(), FunctionType::Kind::Revert, StateMutability::Pure)),
		magicVarDecl("revert", TypeProvider::function(strings{"string memory"}, strings(), FunctionType::Kind::Revert, StateMutability::Pure)),
		magicVarDecl("ripemd160", TypeProvider::function(strings{"bytes memory"}, strings{"bytes20"}, FunctionType::Kind::RIPEMD160, StateMutability::Pure)),
		magicVarDecl("selfdestruct", TypeProvider::function(strings{"address payable"}, strings{}, FunctionType::Kind::Selfdestruct)),
		magicVarDecl("sha256", TypeProvider::function(strings{"bytes memory"}, strings{"bytes32"}, FunctionType::Kind::SHA256, StateMutability::Pure)),
		magicVarDecl("sha3", TypeProvider::function(strings{"bytes memory"}, strings{"bytes32"}, FunctionType::Kind::KECCAK256, StateMutability::Pure)),
		magicVarDecl("suicide", TypeProvider::function(strings{"address payable"}, strings{}, FunctionType::Kind::Selfdestruct)),
		magicVarDecl("tx", TypeProvider::magic(MagicType::Kind::Transaction)),
		// Accepts a MagicType that can be any contract type or an Integer type and returns a
		// MagicType. The TypeChecker handles the correctness of the input and output types.
		magicVarDecl("type", TypeProvider::function(
			strings{},
			strings{},
			FunctionType::Kind::MetaType,
			StateMutability::Pure,
			FunctionType::Options::withArbitraryParameters()
		)),
	};

	if (_evmVersion >= langutil::EVMVersion::cancun())
		magicVariableDeclarations.push_back(
			magicVarDecl("blobhash", TypeProvider::function(strings{"uint256"}, strings{"bytes32"}, FunctionType::Kind::BlobHash, StateMutability::View))
		);

	// Seismic RNG precompile built-in functions
	magicVariableDeclarations.push_back(magicVarDecl("unsafe_rng_u8",   TypeProvider::function(strings{}, strings{"suint8"},   FunctionType::Kind::SeismicRNG, StateMutability::View)));
	magicVariableDeclarations.push_back(magicVarDecl("unsafe_rng_u16",  TypeProvider::function(strings{}, strings{"suint16"},  FunctionType::Kind::SeismicRNG, StateMutability::View)));
	magicVariableDeclarations.push_back(magicVarDecl("unsafe_rng_u32",  TypeProvider::function(strings{}, strings{"suint32"},  FunctionType::Kind::SeismicRNG, StateMutability::View)));
	magicVariableDeclarations.push_back(magicVarDecl("unsafe_rng_u64",  TypeProvider::function(strings{}, strings{"suint64"},  FunctionType::Kind::SeismicRNG, StateMutability::View)));
	magicVariableDeclarations.push_back(magicVarDecl("unsafe_rng_u96",  TypeProvider::function(strings{}, strings{"suint96"},  FunctionType::Kind::SeismicRNG, StateMutability::View)));
	magicVariableDeclarations.push_back(magicVarDecl("unsafe_rng_u128", TypeProvider::function(strings{}, strings{"suint128"}, FunctionType::Kind::SeismicRNG, StateMutability::View)));
	magicVariableDeclarations.push_back(magicVarDecl("unsafe_rng_u256", TypeProvider::function(strings{}, strings{"suint256"}, FunctionType::Kind::SeismicRNG, StateMutability::View)));

	// Seismic RNG precompile built-in functions for shielded fixed bytes
	for (unsigned i = 1; i <= 32; ++i)
		magicVariableDeclarations.push_back(magicVarDecl(
			"unsafe_rng_b" + std::to_string(i),
			TypeProvider::function(strings{}, strings{"sbytes" + std::to_string(i)}, FunctionType::Kind::SeismicRNG, StateMutability::View)
		));

	// Seismic ECDH precompile built-in function
	magicVariableDeclarations.push_back(magicVarDecl("ecdh", TypeProvider::function(strings{"sbytes32", "bytes memory"}, strings{"bytes32"}, FunctionType::Kind::SeismicECDH, StateMutability::View)));

	// Seismic AES-GCM encrypt/decrypt precompile built-in functions
	magicVariableDeclarations.push_back(magicVarDecl("aes_gcm_encrypt", TypeProvider::function(strings{"sbytes32", "uint96", "bytes memory"}, strings{"bytes memory"}, FunctionType::Kind::SeismicAESGCMEncrypt, StateMutability::View)));
	magicVariableDeclarations.push_back(magicVarDecl("aes_gcm_decrypt", TypeProvider::function(strings{"sbytes32", "uint96", "bytes memory"}, strings{"bytes memory"}, FunctionType::Kind::SeismicAESGCMDecrypt, StateMutability::View)));

	// Seismic HKDF precompile built-in function
	magicVariableDeclarations.push_back(magicVarDecl("hkdf", TypeProvider::function(strings{"bytes memory"}, strings{"bytes32"}, FunctionType::Kind::SeismicHKDF, StateMutability::View)));

	// Seismic secp256k1 sign precompile built-in function
	magicVariableDeclarations.push_back(magicVarDecl("secp256k1_sign", TypeProvider::function(strings{"sbytes32", "bytes32"}, strings{"bytes memory"}, FunctionType::Kind::SeismicSecp256k1Sign, StateMutability::View)));

	return magicVariableDeclarations;
}

}

GlobalContext::GlobalContext(langutil::EVMVersion _evmVersion):
	m_magicVariables{constructMagicVariables(_evmVersion)}
{
}

void GlobalContext::setCurrentContract(ContractDefinition const& _contract)
{
	m_currentContract = &_contract;
}

std::vector<Declaration const*> GlobalContext::declarations() const
{
	std::vector<Declaration const*> declarations;
	declarations.reserve(m_magicVariables.size());
	for (ASTPointer<MagicVariableDeclaration const> const& variable: m_magicVariables)
		declarations.push_back(variable.get());
	return declarations;
}

MagicVariableDeclaration const* GlobalContext::currentThis() const
{
	if (!m_thisPointer[m_currentContract])
	{
		Type const* type = TypeProvider::emptyTuple();
		if (m_currentContract)
			type = TypeProvider::contract(*m_currentContract);
		m_thisPointer[m_currentContract] =
			std::make_shared<MagicVariableDeclaration>(magicVariableToID("this"), "this", type);
	}
	return m_thisPointer[m_currentContract].get();
}

MagicVariableDeclaration const* GlobalContext::currentSuper() const
{
	if (!m_superPointer[m_currentContract])
	{
		Type const* type = TypeProvider::emptyTuple();
		if (m_currentContract)
			type = TypeProvider::typeType(TypeProvider::contract(*m_currentContract, true));
		m_superPointer[m_currentContract] =
			std::make_shared<MagicVariableDeclaration>(magicVariableToID("super"), "super", type);
	}
	return m_superPointer[m_currentContract].get();
}

}
