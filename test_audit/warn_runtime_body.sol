// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    suint256 private _val;
    // Literal in function body — SHOULD warn
    function setDefault() external {
        _val = suint256(42);
    }
}
