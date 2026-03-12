contract C {
    function f() public {
        suint256 x = suint256(0);
    }
}
// ====
// EVMVersion: =paris
// compileViaYul: true
// ----
// TypeError 10001: (49-72): Shielded types (suint, sbool, saddress, sbytes, etc.) require the Mercury EVM version or later. The current EVM version "paris" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
