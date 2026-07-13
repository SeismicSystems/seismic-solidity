contract C {
    suint8 private secret = 42;
}
// ====
// EVMVersion: =osaka
// ----
// DeclarationError 10002: (17-23): Shielded type "suint8" requires the Mercury EVM version. The current EVM version "osaka" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
