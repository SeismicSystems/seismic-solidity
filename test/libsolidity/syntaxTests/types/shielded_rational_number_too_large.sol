contract C {
    function f() public pure {
        suint8 a = 256;
        suint8 b = suint8(256);
        sint8 c = sint8(-129);
    }
}
// ----
// TypeError 9574: (52-65): Type sint_const 256 is not implicitly convertible to expected type suint8. Literal is too large to fit in suint8.
// TypeError 9640: (85-95): Explicit type conversion not allowed from "sint_const 256" to "suint8".
// TypeError 9640: (114-124): Explicit type conversion not allowed from "sint_const -129" to "sint8".
