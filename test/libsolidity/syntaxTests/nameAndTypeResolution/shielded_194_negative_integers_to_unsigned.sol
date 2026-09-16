contract test {
    suint8 x = suint8(-1);
}
// ----
// TypeError 9640: (31-41): Explicit type conversion not allowed from "int_const -1" to "suint8". Cannot implicitly convert signed literal to unsigned type.
