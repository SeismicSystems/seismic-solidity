contract C {
    suint a = suint(1 / 0);
}
// ----
// TypeError 2271: (33-38): Built-in binary operator / cannot be applied to types int_const 1 and int_const 0.
// Warning 10403: (27-39): Literals converted to shielded integers will leak during contract deployment.
