contract C {
    suint256 x;
}
// ====
// EVMVersion: =paris
// compileViaYul: true
// ----
// DeclarationError 10002: (17-25): Shielded type "suint256" requires the Mercury EVM version. The current EVM version "paris" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
