// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0;

contract C {
    saddress private sa;

    function set(saddress v) external {
        sa = v;
    }

    function clr() external {
        delete sa;
    }
}
