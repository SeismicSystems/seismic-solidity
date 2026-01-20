// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0;

contract C {
    sbool private sb;

    function set(sbool v) external {
        sb = v;
    }

    function clr() external {
        delete sb;
    }
}
