contract C {
    function f() public pure {
        suint256[] memory arr = new suint256[](1);
        abi.encode(arr);
    }
}
// ----
// TypeError 3648: (114-117): Shielded types cannot be ABI encoded.
