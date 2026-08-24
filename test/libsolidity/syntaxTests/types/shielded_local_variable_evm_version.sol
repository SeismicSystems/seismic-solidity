contract C {
    function f() public {
        suint256 x = suint256(0);
    }
}
// ====
// EVMVersion: =paris
// compileViaYul: true
// ----
// DeclarationError 10002: (47-55): Shielded type "suint256" requires the Mercury EVM version. The current EVM version "paris" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
