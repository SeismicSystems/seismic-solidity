contract C {
    sbytes data;
}
// ====
// EVMVersion: =cancun
// compileViaYul: true
// ----
// DeclarationError 10002: (17-23): Shielded type "sbytes" requires the Mercury EVM version. The current EVM version "cancun" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
