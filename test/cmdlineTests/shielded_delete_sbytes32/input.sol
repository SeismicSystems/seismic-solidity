// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0;

contract C {
    sbytes32 private sbs;

    function set(sbytes32 v) external {
        sbs = v;
    }

    function clr() external {
        delete sbs;
    }
}
