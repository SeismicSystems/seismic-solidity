contract C {
    function f(sbytes memory x) public pure { x; }
    function g(sbytes calldata x) external pure { x; }
}
// ====
// EVMVersion: =cancun
// compileViaYul: true
// ----
// DeclarationError 10002: (28-34): Shielded type "sbytes" requires the Mercury EVM version. The current EVM version "cancun" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
