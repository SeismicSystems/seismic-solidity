// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0;

contract C {
    sbytes16 data;
    function test() external {
        data = sbytes16(0);
    }
}
