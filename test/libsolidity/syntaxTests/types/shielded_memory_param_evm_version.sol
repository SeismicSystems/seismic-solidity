contract C {
    function f(sbytes memory x) public pure { x; }
    function g(sbytes calldata x) external pure { x; }
}
// ====
// EVMVersion: =cancun
// compileViaYul: true
// ----
// TypeError 10001: (28-43): Shielded types (suint, sbool, saddress, sbytes, etc.) require the Mercury EVM version or later. The current EVM version "cancun" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
// TypeError 10001: (79-96): Shielded types (suint, sbool, saddress, sbytes, etc.) require the Mercury EVM version or later. The current EVM version "cancun" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
