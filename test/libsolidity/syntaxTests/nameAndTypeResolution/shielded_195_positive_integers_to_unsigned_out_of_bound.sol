contract test {
    suint8 x = suint8(700);
}
// ----
// TypeError 9640: (31-42): Explicit type conversion not allowed from "int_const 700" to "suint8". Literal is too large to fit in suint8.
