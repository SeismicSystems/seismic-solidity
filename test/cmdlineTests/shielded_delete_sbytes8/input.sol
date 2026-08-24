// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0;

contract C {
    sbytes8 private sbs;

    function set(sbytes8 v) external {
        sbs = v;
    }

    function clr() external {
        delete sbs;
    }
}
