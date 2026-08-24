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
// DeclarationError 10002: (17-25): Shielded type "suint256" requires the Mercury EVM version. The current EVM version "cancun" does not support shielded types. Use "--evm-version mercury" to enable shielded type support.
