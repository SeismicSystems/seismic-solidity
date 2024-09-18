contract C {
    function g() public pure {
        sint a;
        a ** 1E1233;
        a ** (1/2);
    }
}
// ----
// TypeError 2271: (68-79): Built-in binary operator ** cannot be applied to types sint256 and int_const 1000...(1226 digits omitted)...0000. Exponent too large.
// TypeError 2271: (89-99): Built-in binary operator ** cannot be applied to types sint256 and rational_const 1 / 2. Exponent is fractional.
