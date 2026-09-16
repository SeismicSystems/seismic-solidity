contract C {
    struct S { suint256 a; suint256 b; }
    function f(S memory s) internal pure {
        abi.encode(s);
    }
}
// ----
// TypeError 10202: (116-117): Shielded types cannot be ABI encoded.
