contract c {
    function f() public pure {
        sint a;
        a = sint(0 ** 1E1233);
        a = sint(1 ** 1E1233);
        a = sint(-1 ** 1E1233);
        a = sint(0E123456789);
    }
}
// ----
// Warning 9660: (72-89): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (103-120): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (134-152): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (166-183): Literals converted to shielded integers will leak during contract deployment.
