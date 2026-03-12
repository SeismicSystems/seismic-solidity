contract C {
    suint8 private a;
    sint8 private b;

    function test() internal {
        // Bitwise NOT on shielded literal
        a = ~0s;
        b = ~0s;
    }
}
// ----
// Warning 9667: (144-146): Shielded number literals will leak during contract deployment.
// TypeError 7407: (143-146): Type shielded_int_const -1 is not implicitly convertible to expected type suint8. Cannot implicitly convert signed literal to unsigned type.
// Warning 9667: (161-163): Shielded number literals will leak during contract deployment.
