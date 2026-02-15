contract C {
    suint256 x;
}
// ====
// EVMVersion: =paris
// compileViaYul: true
// ----
// TypeError 9978: (20-31): Shielded types (suint, sbool, saddress, sbytes, etc.) require the Mercury EVM version or later. The current EVM version "paris" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
