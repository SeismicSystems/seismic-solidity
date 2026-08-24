contract c {
    function f() public pure {
        suint a = suint(-1);
        suint b = suint(-1);
    }
}
// ----
// TypeError 9640: (62-71): Explicit type conversion not allowed from "int_const -1" to "suint256". Cannot implicitly convert signed literal to unsigned type.
// TypeError 9640: (91-100): Explicit type conversion not allowed from "int_const -1" to "suint256". Cannot implicitly convert signed literal to unsigned type.
