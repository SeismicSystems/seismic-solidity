// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// sync_rng result can be pushed to a shielded dynamic array.
contract C {
    suint256[] private arr;

    function f() public {
        arr.push(sync_rng256());
    }
}
// ----
// Warning 9665: (136-158): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
