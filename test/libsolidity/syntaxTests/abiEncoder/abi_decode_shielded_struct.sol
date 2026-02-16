contract C {
    struct S { suint256 a; suint256 b; }
    function f(bytes memory data) public pure {
        abi.decode(data, (S));
    }
}
// ----
// TypeError 4851: (128-129): Shielded types cannot be ABI encoded.
