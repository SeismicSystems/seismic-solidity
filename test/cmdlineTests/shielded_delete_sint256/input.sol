// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0;

contract C {
    sint256 private si;

    function set(sint256 v) external {
        si = v;
    }

    function clr() external {
        delete si;
    }
}
