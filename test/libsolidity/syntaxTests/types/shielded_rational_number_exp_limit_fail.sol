contract c {
    function f() public pure {
        sint a;
        a = sint((((((4 ** 4) ** 2) ** 4) ** 4) ** 4) ** 4);
        a = sint(-(((4 ** 4 ** 2 ** 4 ** 4) ** 4) ** 4) ** 4);
        a = sint(4 ** (-(2 ** 4 ** 4 ** 4 ** 4 ** 4)));
        a = sint(2 ** 1E1233);
        a = sint(-2 ** 1E1233);
        a = sint(2 ** -1E1233);
        a = sint(-2 ** -1E1233);
        a = sint(1E1233 ** 2);
        a = sint(-1E1233 ** 2);
        a = sint(1E1233 ** -2);
        a = sint(-1E1233 ** -2);
        a = sint(1E1233 ** 1E1233);
        a = sint(1E1233 ** -1E1233);
        a = sint(-1E1233 ** 1E1233);
        a = sint(-1E1233 ** -1E1233);
    }
}
// ----
// TypeError 2271: (77-118): Built-in binary operator ** cannot be applied to types int_const 1797...(301 digits omitted)...7216 and int_const 4.
// TypeError 9640: (72-119): Explicit type conversion not allowed from "int_const 1797...(301 digits omitted)...7216" to "sint256". Literal is too large to fit in sint256.
// TypeError 2271: (147-163): Built-in binary operator ** cannot be applied to types int_const 4 and int_const 1157...(70 digits omitted)...9936.
// TypeError 9640: (133-182): Explicit type conversion not allowed from "int_const 1340...(147 digits omitted)...4096" to "sint256". Literal is too large to fit in sint256.
// TypeError 2271: (219-235): Built-in binary operator ** cannot be applied to types int_const 4 and int_const 1340...(147 digits omitted)...4096.
// TypeError 2271: (201-237): Built-in binary operator ** cannot be applied to types int_const 4 and int_const -115...(71 digits omitted)...9936.
// Warning 9660: (196-238): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (257-268): Built-in binary operator ** cannot be applied to types int_const 2 and int_const 1000...(1226 digits omitted)...0000.
// Warning 9660: (252-269): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (288-300): Built-in binary operator ** cannot be applied to types int_const -2 and int_const 1000...(1226 digits omitted)...0000.
// Warning 9660: (283-301): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (320-332): Built-in binary operator ** cannot be applied to types int_const 2 and int_const -100...(1227 digits omitted)...0000.
// Warning 9660: (315-333): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (352-365): Built-in binary operator ** cannot be applied to types int_const -2 and int_const -100...(1227 digits omitted)...0000.
// Warning 9660: (347-366): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (385-396): Built-in binary operator ** cannot be applied to types int_const 1000...(1226 digits omitted)...0000 and int_const 2.
// TypeError 9640: (380-397): Explicit type conversion not allowed from "int_const 1000...(1226 digits omitted)...0000" to "sint256". Literal is too large to fit in sint256.
// TypeError 2271: (416-428): Built-in binary operator ** cannot be applied to types int_const -100...(1227 digits omitted)...0000 and int_const 2.
// TypeError 9640: (411-429): Explicit type conversion not allowed from "int_const -100...(1227 digits omitted)...0000" to "sint256". Literal is too large to fit in sint256.
// TypeError 2271: (448-460): Built-in binary operator ** cannot be applied to types int_const 1000...(1226 digits omitted)...0000 and int_const -2.
// TypeError 9640: (443-461): Explicit type conversion not allowed from "int_const 1000...(1226 digits omitted)...0000" to "sint256". Literal is too large to fit in sint256.
// TypeError 2271: (480-493): Built-in binary operator ** cannot be applied to types int_const -100...(1227 digits omitted)...0000 and int_const -2.
// TypeError 9640: (475-494): Explicit type conversion not allowed from "int_const -100...(1227 digits omitted)...0000" to "sint256". Literal is too large to fit in sint256.
// TypeError 2271: (513-529): Built-in binary operator ** cannot be applied to types int_const 1000...(1226 digits omitted)...0000 and int_const 1000...(1226 digits omitted)...0000.
// TypeError 9640: (508-530): Explicit type conversion not allowed from "int_const 1000...(1226 digits omitted)...0000" to "sint256". Literal is too large to fit in sint256.
// TypeError 2271: (549-566): Built-in binary operator ** cannot be applied to types int_const 1000...(1226 digits omitted)...0000 and int_const -100...(1227 digits omitted)...0000.
// TypeError 9640: (544-567): Explicit type conversion not allowed from "int_const 1000...(1226 digits omitted)...0000" to "sint256". Literal is too large to fit in sint256.
// TypeError 2271: (586-603): Built-in binary operator ** cannot be applied to types int_const -100...(1227 digits omitted)...0000 and int_const 1000...(1226 digits omitted)...0000.
// TypeError 9640: (581-604): Explicit type conversion not allowed from "int_const -100...(1227 digits omitted)...0000" to "sint256". Literal is too large to fit in sint256.
// TypeError 2271: (623-641): Built-in binary operator ** cannot be applied to types int_const -100...(1227 digits omitted)...0000 and int_const -100...(1227 digits omitted)...0000.
// TypeError 9640: (618-642): Explicit type conversion not allowed from "int_const -100...(1227 digits omitted)...0000" to "sint256". Literal is too large to fit in sint256.
