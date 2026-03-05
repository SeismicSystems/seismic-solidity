contract C {
    suint a = suint(1 / ((1+3)-4));
}
// ----
// TypeError 2271: (33-46): Built-in binary operator / cannot be applied to types int_const 1 and int_const 0.
// Warning 9660: (27-47): Literals converted to shielded integers will leak during contract deployment.
