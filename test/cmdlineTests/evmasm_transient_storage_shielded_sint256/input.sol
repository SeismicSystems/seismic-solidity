// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0.0;

contract C {
    sint256 transient x;
    function set(sint256 v) external {
        x = v;
    }
    function get() external {
        sint256 y = x;
    }
}
