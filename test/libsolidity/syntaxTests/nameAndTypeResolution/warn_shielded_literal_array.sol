contract C {
    constructor() {
        suint[2] memory a = [suint(1), suint(2)];
        sbool[2] memory b = [sbool(true), sbool(false)];
        a[0] = suint(3);
        b[1] = sbool(true);
    }
}
// ----
// Warning 10403: (62-70): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (72-80): Literals converted to shielded integers will leak during contract deployment.
// Warning 10406: (112-123): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 10406: (125-137): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 10403: (155-163): Literals converted to shielded integers will leak during contract deployment.
// Warning 10406: (180-191): Bool Literals converted to shielded bools will leak during contract deployment.
