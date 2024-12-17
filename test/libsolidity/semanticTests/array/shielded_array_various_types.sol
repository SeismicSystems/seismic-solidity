// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShieldedArrayTest {
    suint[] shieldedUints;
    saddress[] shieldedAddresses;
    sbool[] shieldedBools;

    constructor(suint _shieldedUint, saddress _shieldedAddress, sbool _shieldedBool) {
        shieldedUints.push(_shieldedUint);
        shieldedAddresses.push(_shieldedAddress);
        shieldedBools.push(_shieldedBool);
    }

    function addShieldedUint(suint _val) external {
        shieldedUints.push(_val);
    }

    function addShieldedAddress(saddress _val) external {
        shieldedAddresses.push(_val);
    }

    function addShieldedBool(sbool _val) external {
        shieldedBools.push(_val);
    }

    // GetShieldedUint in normal Solidity
    function getShieldedUint(uint256 index) external view returns (uint) {
        require(index < shieldedUints.length, "Index out of bounds");
        return uint(shieldedUints[index]);
    }

    // GetShieldedUint using assembly + CLOAD (hypothetical)
    function getShieldedUintAssembly(uint256 index) external view returns (uint) {
        assembly {
            // Storage slot of shieldedUints array is 0 (first declared variable)
            // 1. Compute the storage location of the length: keccak256(slot)
            let slot := 0
            let lengthLoc := keccak256(0x0, 0x20)      // keccak256 of slot as bytes
            let length := cload(lengthLoc)

            // 2. Check bounds
            if iszero(lt(index, length)) {
                revert(0,0)
            }

            // 3. Compute element position: lengthLoc + index
            let elemLoc := add(lengthLoc, index)

            // 4. Use hypothetical CLOAD for shielded load
            // Assuming CLOAD(elemLoc) returns the shielded-uint storage content
            // Since this is hypothetical, we just emulate the step:
            let val := cload(elemLoc)

            // 5. Return value
            // Normally: mstore(0x0, val), return(0x0, 32)
            mstore(0x0, val)
            return(0x0, 0x20)
        }
    }

    // GetShieldedAddress in normal Solidity
    function getShieldedAddress(uint256 index) external view returns (address) {
        require(index < shieldedAddresses.length, "Index out of bounds");
        return address(shieldedAddresses[index]);
    }

    // GetShieldedAddress using assembly + CLOAD
    function getShieldedAddressAssembly(uint256 index) external view returns (address) {
        assembly {
            // shieldedAddresses is second variable, slot = 1
            let slot := 1
            let lengthLoc := keccak256(0x0, 0x20)
            // To compute keccak256(slot), store slot in memory:
            mstore(0x0, slot)
            lengthLoc := keccak256(0x0, 0x20)

            let length := cload(lengthLoc)
            if iszero(lt(index, length)) {
                revert(0,0)
            }

            let elemLoc := add(lengthLoc, index)
            let val := cload(elemLoc) // Hypothetical shielded address load
            mstore(0x0, val)
            return(0x0, 0x20)
        }
    }

    // GetShieldedBool in normal Solidity
    function getShieldedBool(uint256 index) external view returns (bool) {
        require(index < shieldedBools.length, "Index out of bounds");
        return bool(shieldedBools[index]);
    }

    // GetShieldedBool using assembly + CLOAD
    function getShieldedBoolAssembly(uint256 index) external view returns (bool) {
        assembly {
            // shieldedBools is third variable, slot = 2
            mstore(0x0, 2)
            let lengthLoc := keccak256(0x0, 0x20)
            let length := cload(lengthLoc)
            if iszero(lt(index, length)) {
                revert(0,0)
            }

            let elemLoc := add(lengthLoc, index)
            let val := cload(elemLoc) // Hypothetical shielded bool load
            // val should be either 0 or 1
            mstore(0x0, val)
            return(0x0, 0x20)
        }
    }
}
// ----
// constructor(suint256, saddress, sbool): 10, 0x5082a85c489be6aa0f2e6693bf09cc1bbd35e988, true
// getShieldedUintAssembly(uint256): 0 -> 10
// getShieldedAddress(uint256): 0 -> 0x5082a85c489be6aa0f2e6693bf09cc1bbd35e988
// getShieldedAddressAssembly(uint256): 0 -> 0x5082a85c489be6aa0f2e6693bf09cc1bbd35e988
// getShieldedBool(uint256): 0 -> true
// getShieldedBoolAssembly(uint256): 0 -> true
