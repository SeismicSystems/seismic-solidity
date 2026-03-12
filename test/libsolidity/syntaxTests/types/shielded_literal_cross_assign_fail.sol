contract C {
    saddress private a;
    sbool private b;

    function test() internal {
        // Cannot assign shielded number literal to saddress
        a = 0s;
        // Cannot assign shielded number literal to sbool
        b = 1s;
    }
}
// ----
// Warning 9667: (163-165): Shielded number literals will leak during contract deployment.
// TypeError 7407: (163-165): Type shielded_int_const 0 is not implicitly convertible to expected type saddress.
// Warning 9667: (237-239): Shielded number literals will leak during contract deployment.
// TypeError 7407: (237-239): Type shielded_int_const 1 is not implicitly convertible to expected type sbool.
