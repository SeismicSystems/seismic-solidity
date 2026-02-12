contract C {
    function f(suint y) public pure {
        // fits FixedBytes with exactly 32-bytes
        y = suint(0xffffffff00000000ffffffff00000000ffffffff00000000ffffffff00000000); // FixedBytes (32)

        // fits exactly sinto FixedBytes (32), ensures underscored literals won't hurt
        y = suint(0xffffffff00000000ffffffff00000000ffffffff00000000ffffffff_00000000);
    }
}
// ----
// Warning 9660: (112-185): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (306-380): Literals converted to shielded integers will leak during contract deployment.
