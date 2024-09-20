contract test {
    sint8 public j = 128;
}
// ----
// TypeError 7407: (37-40): Type int_const 128 is not implicitly convertible to expected type sint8. Literal is too large to fit in sint8.
