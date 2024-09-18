contract c {
    function f() public pure {
        sint a;
        a = 1/(2<<4094)/(2<<4094);
    }
}
// ----
// TypeError 2271: (71-92): Built-in binary operator / cannot be applied to types rational_const 1 / 5221...(1225 digits omitted)...5168 and sint_const 5221...(1225 digits omitted)...5168. Precision of rational constants is limited to 4096 bits.
// TypeError 2326: (71-92): Type rational_const 1 / 5221...(1225 digits omitted)...5168 is not implicitly convertible to expected type sint256. Try converting to type ufixed8x80 or use an explicit conversion.
