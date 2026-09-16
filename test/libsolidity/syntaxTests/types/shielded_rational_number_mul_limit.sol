contract c {
    function f() public pure {
        sint a;
        a = sint((1<<4095)*(1<<4095));
    }
}
// ----
// TypeError 2271: (77-96): Built-in binary operator * cannot be applied to types int_const 5221...(1225 digits omitted)...5168 and int_const 5221...(1225 digits omitted)...5168. Precision of rational constants is limited to 4096 bits.
// TypeError 9640: (72-97): Explicit type conversion not allowed from "int_const 5221...(1225 digits omitted)...5168" to "sint256". Literal is too large to fit in sint256.
