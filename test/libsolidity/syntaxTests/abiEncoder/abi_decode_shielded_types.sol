contract C {
    function f(bytes memory data) public pure {
        abi.decode(data, (suint256));
    }
}
// ----
// TypeError 10201: (87-95): Shielded types cannot be ABI encoded.
