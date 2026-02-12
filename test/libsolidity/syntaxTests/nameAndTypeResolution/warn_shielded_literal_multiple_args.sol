contract C {
    struct S {
        uint x;
        sbool a;
        sbool b;
    }
    constructor() {
        S memory s = S(42, sbool(true), sbool(false));
    }
}
// ----
// Warning 9661: (131-142): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 9661: (144-156): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 2072: (112-122): Unused local variable.
