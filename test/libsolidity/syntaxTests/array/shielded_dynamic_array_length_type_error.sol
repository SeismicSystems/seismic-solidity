contract C {
    suint[] dynamicArray;

    function f() public view {
        // Dynamic shielded array .length is suint256, cannot implicitly convert to uint256
        uint256 len = dynamicArray.length;
    }
}
// ----
// Warning 10305: (17-37): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 9574: (171-204): Type suint256 is not implicitly convertible to expected type uint256.
