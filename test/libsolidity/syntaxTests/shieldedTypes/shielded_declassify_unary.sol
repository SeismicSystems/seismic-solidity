contract C {
    suint256 secret;
    function f() external view returns (uint256) {
        return ~uint256(secret);
    }
}
// ----
// Warning 10313: (101-116): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
