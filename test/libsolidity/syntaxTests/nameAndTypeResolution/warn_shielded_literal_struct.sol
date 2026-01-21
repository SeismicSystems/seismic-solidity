contract C {
    struct S { sbool b; }
    constructor() {
        sbool direct = sbool(true);
        S memory s = S({b: sbool(true)});
        s.b = direct;
    }
}
// ----
// Warning 9661: (67-93): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 9661: (103-135): Bool Literals converted to shielded bools will leak during contract deployment.
