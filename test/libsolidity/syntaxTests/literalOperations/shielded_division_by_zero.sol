contract C {
    suint a = suint(1 / 0);
}
// ----
// TypeError 2271: (33-38): Built-in binary operator / cannot be applied to types int_const 1 and int_const 0.
