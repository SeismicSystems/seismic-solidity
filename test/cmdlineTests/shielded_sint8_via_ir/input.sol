// SPDX-License-Identifier: GPL-3.0
// Adapted from: cmdlineTests/shielded_suint8_via_ir/input.sol
pragma solidity >=0.0;

contract C {
    sint8 data;
    function test() external {
        data = sint8(0);
    }
}
