contract C {
    suint b3 = 1 % 0;
}
// ----
// TypeError 2271: (28-33): Built-in binary operator % cannot be applied to types int_const 1 and int_const 0.
