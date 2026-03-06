// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestPush {
    suint256[] arr;
    // arr.push() is a built-in, not an external call — SHOULD warn
    function f() public {
        arr.push(suint256(1));
    }
}
