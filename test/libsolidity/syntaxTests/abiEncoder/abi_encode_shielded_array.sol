contract C {
    function f() public pure {
        suint256[] memory arr = new suint256[](1);
        abi.encode(arr);
    }
}
// ----
// TypeError 10202: (114-117): Shielded types cannot be ABI encoded.
