// SPDX-License-Identifier: GPL-3.0
// Adapted from: cmdlineTests/shielded_suint32_via_ir/input.sol
pragma solidity >=0.0;

contract C {
    sint32 data;
    function test() external {
        data = sint32(0);
    }
}
