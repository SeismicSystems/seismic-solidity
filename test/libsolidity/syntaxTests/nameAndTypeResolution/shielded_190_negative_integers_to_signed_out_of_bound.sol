contract test {
    sint8 public i = -129;
}
// ----
// TypeError 7407: (36-40): Type sint_const -129 is not implicitly convertible to expected type sint8. Literal is too large to fit in sint8.
