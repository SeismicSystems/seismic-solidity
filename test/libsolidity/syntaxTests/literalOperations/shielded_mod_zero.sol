contract C {
    suint b3 = suint(1 % 0);
}
// ----
// TypeError 2271: (34-39): Built-in binary operator % cannot be applied to types int_const 1 and int_const 0.
