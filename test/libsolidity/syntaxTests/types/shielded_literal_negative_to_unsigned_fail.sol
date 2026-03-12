contract C {
    suint8 private x;

    function test() internal {
        x = -1s;
    }
}
// ----
// Warning 9667: (80-82): Shielded number literals will leak during contract deployment.
// TypeError 7407: (79-82): Type shielded_int_const -1 is not implicitly convertible to expected type suint8. Cannot implicitly convert signed literal to unsigned type.
