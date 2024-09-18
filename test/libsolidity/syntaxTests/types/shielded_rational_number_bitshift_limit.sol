contract c {
    function f() public pure {
        sint a;
        a = 1 << 4095; // shift is fine, but result too large
        a = 1 << 4096; // too large
        a = (1E1233) << 2; // too large
    }
}
// ----
//TypeError 7407: (72-81): Type int_const 5221...(1225 digits omitted)...5168 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.
//TypeError 2271: (134-143): Built-in binary operator << cannot be applied to types int_const 1 and int_const 4096.
//TypeError 2271: (170-183): Built-in binary operator << cannot be applied to types int_const 1000...(1226 digits omitted)...0000 and int_const 2.
//TypeError 7407: (170-183): Type int_const 1000...(1226 digits omitted)...0000 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.