contract C {
    suint b3 = suint(1 % (-4+((2)*2)));
}
// ----
// TypeError 2271: (34-50): Built-in binary operator % cannot be applied to types int_const 1 and int_const 0.
// Warning 9660: (28-51): Literals converted to shielded integers will leak during contract deployment.
