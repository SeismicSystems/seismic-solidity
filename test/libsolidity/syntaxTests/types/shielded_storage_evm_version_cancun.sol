contract C {
    suint256 a;
    sbool b;
    saddress c;
    suint8 d;
}
// ====
// EVMVersion: =cancun
// compileViaYul: true
// ----
// TypeError 9978: (20-31): Shielded types (suint, sbool, saddress, sbytes, etc.) require the Mercury EVM version or later. The current EVM version "cancun" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
// TypeError 9978: (37-46): Shielded types (suint, sbool, saddress, sbytes, etc.) require the Mercury EVM version or later. The current EVM version "cancun" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
// TypeError 9978: (52-64): Shielded types (suint, sbool, saddress, sbytes, etc.) require the Mercury EVM version or later. The current EVM version "cancun" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
// TypeError 9978: (70-79): Shielded types (suint, sbool, saddress, sbytes, etc.) require the Mercury EVM version or later. The current EVM version "cancun" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
