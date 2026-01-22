// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0;

contract C {
    suint256 private su;

    function set(suint256 v) external {
        su = v;
    }

    function clr() external {
        delete su;
    }
}
