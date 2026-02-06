contract C {
    struct S { sbool b; }
    constructor() {
        sbool direct = sbool(true);
        S memory s = S(sbool(true));
        s.b = direct;
    }
}
// ----
// Warning 9661: (67-93): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 9661: (103-130): Bool Literals converted to shielded bools will leak during contract deployment.
