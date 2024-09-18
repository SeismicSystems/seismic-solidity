contract c {
    function f() public pure {
        suint a = -1;
        suint b = suint(-1);
    }
}
// ----
// TypeError 9574: (52-64): Type int_const -1 is not implicitly convertible to expected type suint256.
// TypeError 9640: (84-93): Explicit type conversion not allowed from "int_const -1" to "suint256".
