// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngArrayStorage {
    suint256[] private arr;

    // Push random values into a dynamic array.
    function pushRandomValues() public {
        for (uint i = 0; i < 5; i++) {
            arr.push(sync_rng256());
        }
    }

    function testLength() public view returns (bool) {
        return uint256(arr.length) == 5;
    }

    function testAllNonzero() public view returns (bool) {
        uint len = uint256(arr.length);
        for (uint i = 0; i < len; i++) {
            if (uint256(arr[i]) == 0) return false;
        }
        return true;
    }

    function testNotAllSame() public view returns (bool) {
        uint256 first = uint256(arr[0]);
        uint len = uint256(arr.length);
        for (uint i = 1; i < len; i++) {
            if (uint256(arr[i]) != first) return true;
        }
        return false;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// pushRandomValues() ->
// testLength() -> true
// testAllNonzero() -> true
// testNotAllSame() -> true
