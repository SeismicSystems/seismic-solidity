// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng calls within loops should compile.
contract C {
    suint256[] private arr;

    function f() public {
        for (uint i = 0; i < 10; i++) {
            arr.push(sync_rng256());
        }
    }
}
// ----
// Warning 9665: (121-143): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
