contract C {
    sbytes data;
}
// ====
// EVMVersion: =cancun
// compileViaYul: true
// ----
// TypeError 9978: (20-31): Shielded types (suint, sbool, saddress, sbytes, etc.) require the Mercury EVM version or later. The current EVM version "cancun" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
