contract c {
    function f() public pure {
        sint a;
        a = (1<<4095)*(1<<4095);
    }
}
// ----
// TypeError 2271: (71-90): Built-in binary operator * cannot be applied to types sint_const 5221...(1225 digits omitted)...5168 and sint_const 5221...(1225 digits omitted)...5168. Precision of rational constants is limited to 4096 bits.
// TypeError 7407: (71-90): Type sint_const 5221...(1225 digits omitted)...5168 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.
