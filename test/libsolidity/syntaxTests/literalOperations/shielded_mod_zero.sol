contract C {
    suint b3 = suint(1 % 0);
}
// ----
// TypeError 2271: (34-39): Built-in binary operator % cannot be applied to types int_const 1 and int_const 0.
// Warning 9660: (28-40): Literals converted to shielded integers will leak during contract deployment.
