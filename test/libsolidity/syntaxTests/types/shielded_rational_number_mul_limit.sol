contract c {
    function f() public pure {
        sint a;
        a = (1<<4095)*(1<<4095);
    }
}
// ----
// TypeError 2271: (72-91): Built-in binary operator * cannot be applied to types int_const 5221...(1225 digits omitted)...5168 and int_const 5221...(1225 digits omitted)...5168. Precision of rational constants is limited to 4096 bits.
// TypeError 7407: (72-91): Type int_const 5221...(1225 digits omitted)...5168 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.
