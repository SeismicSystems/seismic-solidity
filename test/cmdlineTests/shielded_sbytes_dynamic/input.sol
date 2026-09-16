// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0;

contract Blah {
    sbytes data;
    function test() external {
        data.push(sbytes1(0x42));
    }
}
