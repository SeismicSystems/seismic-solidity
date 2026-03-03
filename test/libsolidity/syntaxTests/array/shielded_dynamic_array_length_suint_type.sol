contract C {
    suint[] dynamicArray;
    suint[5] fixedArray;

    function f() public view {
        // Dynamic shielded array .length is suint256
        suint256 dynLen = dynamicArray.length;
        // Fixed-length shielded array .length is uint256
        uint256 fixLen = fixedArray.length;
    }
}
// ----
// Warning 9665: (17-37): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 2072: (158-173): Unused local variable.
// Warning 2072: (263-277): Unused local variable.
