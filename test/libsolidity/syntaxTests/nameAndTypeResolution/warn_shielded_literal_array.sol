contract C {
    constructor() {
        suint[2] memory a = [suint(1), suint(2)];
        sbool[2] memory b = [sbool(true), sbool(false)];
        a[0] = suint(3);
        b[1] = sbool(true);
    }
}
// ----
// Warning 9660: (62-70): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (72-80): Literals converted to shielded integers will leak during contract deployment.
// Warning 9661: (112-123): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 9661: (125-137): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 9660: (155-163): Literals converted to shielded integers will leak during contract deployment.
// Warning 9661: (180-191): Bool Literals converted to shielded bools will leak during contract deployment.
