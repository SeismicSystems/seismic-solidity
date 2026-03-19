// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u result can be pushed to a shielded dynamic array.
contract C {
    suint256[] private arr;

    function f() public {
        arr.push(unsafe_rng_u256());
    }
}
// ----
// Warning 10305: (136-158): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
