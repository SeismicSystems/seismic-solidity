contract C {
    constructor() {
        suint[2] memory a = [suint(1), suint(2)];
        sbool[2] memory b = [sbool(true), sbool(false)];
        a[0] = suint(3);
        b[1] = sbool(true);
    }
}
// ----
// Warning 9660: (41-81): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (41-81): Literals converted to shielded integers will leak during contract deployment.
// Warning 9661: (91-138): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 9661: (91-138): Bool Literals converted to shielded bools will leak during contract deployment.
