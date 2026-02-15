contract C {
    suint256 a;
    sbool b;
    saddress c;
    sbytes data;

    struct S {
        suint256 x;
        uint256 y;
    }
    S s;
}
// ====
// EVMVersion: >=mercury
// compileViaYul: true
