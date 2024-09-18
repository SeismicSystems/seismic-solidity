contract c {
    function f() public pure {
        suint a = -1;
        suint b = suint(-1);
    }
}
// ----
// TypeError 9574: (52-63): Type sint_const -1 is not implicitly convertible to expected type suint256. Cannot implicitly convert signed literal to unsigned type.
// TypeError 9640: (82-90): Explicit type conversion not allowed from "sint_const -1" to "suint256".
