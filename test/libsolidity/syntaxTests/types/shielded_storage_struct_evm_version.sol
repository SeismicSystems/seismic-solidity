contract C {
    struct S {
        suint256 x;
        uint256 y;
    }
    S s;
}
// ====
// EVMVersion: =paris
// compileViaYul: true
// ----
// TypeError 10001: (88-91): Shielded types (suint, sbool, saddress, sbytes, etc.) require the Mercury EVM version or later. The current EVM version "paris" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
