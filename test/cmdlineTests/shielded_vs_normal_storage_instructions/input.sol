pragma solidity >=0.0;
// SPDX-License-Identifier: MIT
contract C {
    // Normal types (should generate SLOAD/SSTORE)
    bytes normalBytes;
    string normalString;
    
    // Shielded types (should generate CLOAD/CSTORE)
    sbytes shieldedBytes;
    sstring shieldedString;
    
    function setNormalBytes(bytes memory _data) public {
        normalBytes = _data;
    }
    
    function setShieldedBytes(sbytes memory _data) public {
        shieldedBytes = _data;
    }
    
    function setNormalString(string memory _data) public {
        normalString = _data;
    }
    
    function setShieldedString(sstring memory _data) public {
        shieldedString = _data;
    }
}