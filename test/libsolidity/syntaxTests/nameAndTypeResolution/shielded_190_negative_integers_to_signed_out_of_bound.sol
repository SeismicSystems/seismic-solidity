contract test {
    sint8 i = sint8(-129);
}
// ----
// TypeError 9640: (30-41): Explicit type conversion not allowed from "int_const -129" to "sint8". Literal is too large to fit in sint8.
