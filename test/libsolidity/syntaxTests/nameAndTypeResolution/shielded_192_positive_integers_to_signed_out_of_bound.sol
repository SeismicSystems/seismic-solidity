contract test {
    sint8 j = 128;
}
// ----
// TypeError 7407: (30-33): Type int_const 128 is not implicitly convertible to expected type sint8. Literal is too large to fit in sint8.
