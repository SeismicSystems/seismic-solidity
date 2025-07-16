pragma solidity >=0.0;
// SPDX-License-Identifier: MIT
contract C {
    sbytes shieldedBytes;

    function setShieldedBytes(sbytes memory _data) public {
        shieldedBytes = _data;
    }
}