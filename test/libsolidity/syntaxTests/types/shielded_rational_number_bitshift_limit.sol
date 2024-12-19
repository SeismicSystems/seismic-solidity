contract c {
    function f() public pure {
        sint a;
        a = sint(1 << 4095); // shift is fine, but result too large
        a = sint(1 << 4096); // too large
        a = sint((1E1233) << 2); // too large
    }
}
// ----
// TypeError 9640: (72-87): Explicit type conversion not allowed from "int_const 5221...(1225 digits omitted)...5168" to "sint256". Literal is too large to fit in sint256.
// TypeError 2271: (145-154): Built-in binary operator << cannot be applied to types int_const 1 and int_const 4096.
// TypeError 2271: (187-200): Built-in binary operator << cannot be applied to types int_const 1000...(1226 digits omitted)...0000 and int_const 2.
// TypeError 9640: (182-201): Explicit type conversion not allowed from "int_const 1000...(1226 digits omitted)...0000" to "sint256". Literal is too large to fit in sint256.
