contract C {
    sint8 private a;
    sint16 private b;

    function test() internal {
        a = 128s;
        a = -129s;
        b = 32768s;
    }
}
// ----
// Warning 9667: (100-104): Shielded number literals will leak during contract deployment.
// TypeError 7407: (100-104): Type shielded_int_const 128 is not implicitly convertible to expected type sint8. Literal is too large to fit in sint8.
// Warning 9667: (119-123): Shielded number literals will leak during contract deployment.
// TypeError 7407: (118-123): Type shielded_int_const -129 is not implicitly convertible to expected type sint8. Literal is too large to fit in sint8.
// Warning 9667: (137-143): Shielded number literals will leak during contract deployment.
// TypeError 7407: (137-143): Type shielded_int_const 32768 is not implicitly convertible to expected type sint16. Literal is too large to fit in sint16.
