// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0.0;

contract C {
    suint256 transient x;
    function set(suint256 v) external {
        x = v;
    }
    function get() external view {
        x;
    }
}
