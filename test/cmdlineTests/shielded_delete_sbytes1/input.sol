// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0;

contract C {
    sbytes1 private sbs;

    function set(sbytes1 v) external {
        sbs = v;
    }

    function clr() external {
        delete sbs;
    }
}
