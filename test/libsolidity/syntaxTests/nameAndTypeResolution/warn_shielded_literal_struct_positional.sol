contract C {
    struct S { sbool b; }
    constructor() {
        sbool direct = sbool(true);
        S memory s = S(sbool(true));
        s.b = direct;
    }
}
// ----
// Warning 10406: (82-93): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 10406: (118-129): Bool Literals converted to shielded bools will leak during contract deployment.
