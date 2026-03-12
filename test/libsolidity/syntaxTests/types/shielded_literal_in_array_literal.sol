contract C {
    function test() internal {
        // Array literal with shielded values
        suint8[3] memory arr = [suint8(1s), suint8(2s), suint8(3s)];
    }
}
// ----
// Warning 9667: (129-131): Shielded number literals will leak during contract deployment.
// Warning 9660: (122-132): Literals converted to shielded integers will leak during contract deployment.
// Warning 9667: (141-143): Shielded number literals will leak during contract deployment.
// Warning 9660: (134-144): Literals converted to shielded integers will leak during contract deployment.
// Warning 9667: (153-155): Shielded number literals will leak during contract deployment.
// Warning 9660: (146-156): Literals converted to shielded integers will leak during contract deployment.
// Warning 2072: (98-118): Unused local variable.
// Warning 2018: (17-164): Function state mutability can be restricted to pure
