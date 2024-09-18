contract C {
    function f() public pure {
        suint8 a = 256;
        suint8 b = suint8(256);
        sint8 c = sint8(-129);
    }
}
// ----
// TypeError 9574: (52-66): Type int_const 256 is not implicitly convertible to expected type suint8. Literal is too large to fit in suint8.
// TypeError 9640: (87-98): Explicit type conversion not allowed from "int_const 256" to "suint8".
// TypeError 9640: (118-129): Explicit type conversion not allowed from "int_const -129" to "sint8".
