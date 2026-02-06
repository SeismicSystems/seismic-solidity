contract C {
    suint[] dynamicArray;

    function f() public view {
        // Dynamic shielded array .length is suint256, cannot implicitly convert to uint256
        uint256 len = dynamicArray.length;
    }
}
// ----
// TypeError 9574: (171-204): Type suint256 is not implicitly convertible to expected type uint256.
