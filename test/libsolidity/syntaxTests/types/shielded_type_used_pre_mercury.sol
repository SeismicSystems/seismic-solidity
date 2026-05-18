contract C {
    suint8 private secret = 42;
}
// ====
// EVMVersion: =paris
// ----
// DeclarationError 10002: (17-23): Shielded type "suint8" requires the Mercury EVM version or later. The current EVM version "paris" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
