contract C {
    function f() public pure {
        saddress(0x11223345567aaaaaaaaaaaaaaaaaaaaaaaaaaaaa0112233445566778899001122);
    }
}
// ----
// TypeError 9640: (52-129): Explicit type conversion not allowed from "int_const 1239...(70 digits omitted)...8130" to "saddress".
