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
// DeclarationError 10002: (36-44): Shielded type "suint256" requires the Mercury EVM version. The current EVM version "paris" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
