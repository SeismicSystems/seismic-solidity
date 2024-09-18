contract c {
    function f() public pure {
        sint a;
        a = 1 << 4095; // shift is fine, but result too large
        a = 1 << 4096; // too large
        a = (1E1233) << 2; // too large
    }
}
// ----
// TypeError 7407: (71-80): Type sint_const 5221...(1225 digits omitted)...5168 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.
// TypeError 2271: (133-142): Built-in binary operator << cannot be applied to types sint_const 1 and sint_const 4096.
// TypeError 2271: (169-182): Built-in binary operator << cannot be applied to types sint_const 1000...(1226 digits omitted)...0000 and sint_const 2.
// TypeError 7407: (169-182): Type sint_const 1000...(1226 digits omitted)...0000 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.
