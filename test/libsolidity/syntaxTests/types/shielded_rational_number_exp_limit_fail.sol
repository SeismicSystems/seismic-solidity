contract c {
    function f() public pure {
        sint a;
        a = (((((4 ** 4) ** 2) ** 4) ** 4) ** 4) ** 4;
        a = -(((4 ** 4 ** 2 ** 4 ** 4) ** 4) ** 4) ** 4;
        a = 4 ** (-(2 ** 4 ** 4 ** 4 ** 4 ** 4));
        a = 2 ** 1E1233;
        a = -2 ** 1E1233;
        a = 2 ** -1E1233;
        a = -2 ** -1E1233;
        a = 1E1233 ** 2;
        a = -1E1233 ** 2;
        a = 1E1233 ** -2;
        a = -1E1233 ** -2;
        a = 1E1233 ** 1E1233;
        a = 1E1233 ** -1E1233;
        a = -1E1233 ** 1E1233;
        a = -1E1233 ** -1E1233;
    }
}
// ----
//TypeError 2271: (72-113): Built-in binary operator ** cannot be applied to types int_const 1797...(301 digits omitted)...7216 and int_const 4.
//TypeError 7407: (72-113): Type int_const 1797...(301 digits omitted)...7216 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.
//TypeError 2271: (136-152): Built-in binary operator ** cannot be applied to types int_const 4 and int_const 1157...(70 digits omitted)...9936.
//TypeError 7407: (127-170): Type int_const 1340...(147 digits omitted)...4096 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.
//TypeError 2271: (202-218): Built-in binary operator ** cannot be applied to types int_const 4 and int_const 1340...(147 digits omitted)...4096.
//TypeError 2271: (184-220): Built-in binary operator ** cannot be applied to types int_const 4 and int_const -115...(71 digits omitted)...9936.
//TypeError 2271: (234-245): Built-in binary operator ** cannot be applied to types int_const 2 and int_const 1000...(1226 digits omitted)...0000.
//TypeError 2271: (259-271): Built-in binary operator ** cannot be applied to types int_const -2 and int_const 1000...(1226 digits omitted)...0000.
//TypeError 2271: (285-297): Built-in binary operator ** cannot be applied to types int_const 2 and int_const -100...(1227 digits omitted)...0000.
//TypeError 2271: (311-324): Built-in binary operator ** cannot be applied to types int_const -2 and int_const -100...(1227 digits omitted)...0000.
//TypeError 2271: (338-349): Built-in binary operator ** cannot be applied to types int_const 1000...(1226 digits omitted)...0000 and int_const 2.
//TypeError 7407: (338-349): Type int_const 1000...(1226 digits omitted)...0000 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.
//TypeError 2271: (363-375): Built-in binary operator ** cannot be applied to types int_const -100...(1227 digits omitted)...0000 and int_const 2.
//TypeError 7407: (363-375): Type int_const -100...(1227 digits omitted)...0000 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.
//TypeError 2271: (389-401): Built-in binary operator ** cannot be applied to types int_const 1000...(1226 digits omitted)...0000 and int_const -2.
//TypeError 7407: (389-401): Type int_const 1000...(1226 digits omitted)...0000 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.
//TypeError 2271: (415-428): Built-in binary operator ** cannot be applied to types int_const -100...(1227 digits omitted)...0000 and int_const -2.
//TypeError 7407: (415-428): Type int_const -100...(1227 digits omitted)...0000 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.
//TypeError 2271: (442-458): Built-in binary operator ** cannot be applied to types int_const 1000...(1226 digits omitted)...0000 and int_const 1000...(1226 digits omitted)...0000.
//TypeError 7407: (442-458): Type int_const 1000...(1226 digits omitted)...0000 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.
//TypeError 2271: (472-489): Built-in binary operator ** cannot be applied to types int_const 1000...(1226 digits omitted)...0000 and int_const -100...(1227 digits omitted)...0000.
//TypeError 7407: (472-489): Type int_const 1000...(1226 digits omitted)...0000 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.
//TypeError 2271: (503-520): Built-in binary operator ** cannot be applied to types int_const -100...(1227 digits omitted)...0000 and int_const 1000...(1226 digits omitted)...0000.
//TypeError 7407: (503-520): Type int_const -100...(1227 digits omitted)...0000 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.
//TypeError 2271: (534-552): Built-in binary operator ** cannot be applied to types int_const -100...(1227 digits omitted)...0000 and int_const -100...(1227 digits omitted)...0000.
//TypeError 7407: (534-552): Type int_const -100...(1227 digits omitted)...0000 is not implicitly convertible to expected type sint256. Literal is too large to fit in sint256.