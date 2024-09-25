contract C {
    suint a = 1 / 0;
}
// ----
// TypeError 2271: (27-32): Built-in binary operator / cannot be applied to types int_const 1 and int_const 0.
