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
// ----
// Warning 10305: (62-73): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
