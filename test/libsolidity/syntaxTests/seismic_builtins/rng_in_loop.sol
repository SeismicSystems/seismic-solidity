// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// unsafe_rng_u calls within loops should compile.
contract C {
    suint256[] private arr;

    function f() public {
        for (uint i = 0; i < 10; i++) {
            arr.push(unsafe_rng_u256());
        }
    }
}
// ----
// Warning 10305: (125-147): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
