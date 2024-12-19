contract test {
    sint8 j = sint8(128);
}
// ----
// TypeError 9640: (30-40): Explicit type conversion not allowed from "int_const 128" to "sint8". Literal is too large to fit in sint8.
