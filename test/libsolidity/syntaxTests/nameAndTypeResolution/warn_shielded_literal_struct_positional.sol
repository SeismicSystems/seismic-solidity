contract C {
    struct S { sbool b; }
    constructor() {
        sbool direct = sbool(true);
        S memory s = S(sbool(true));
        s.b = direct;
    }
}
// ----
// Warning 9661: (82-93): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 9661: (118-129): Bool Literals converted to shielded bools will leak during contract deployment.
