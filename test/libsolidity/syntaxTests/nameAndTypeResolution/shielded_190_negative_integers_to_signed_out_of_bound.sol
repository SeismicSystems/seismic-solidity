contract test {
    sint8 i = -129;
}
// ----
// TypeError 7407: (30-34): Type int_const -129 is not implicitly convertible to expected type sint8. Literal is too large to fit in sint8.
