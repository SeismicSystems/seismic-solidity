contract test {
    function f() public {
        sint x = sint(3);
        sint y = sint(4);
        sint(x ** y);
    }
    function h() public {
        suint8 x = suint8(3);
        sint16 y = sint16(4);
        sint(x ** y);
    }
    function i() public {
        sint16 x = sint16(4);
        sint(x ** sint(-3));
    }
}
// ----
// Warning 10403: (59-66): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (85-92): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (107-113): Built-in binary operator ** cannot be applied to types sint256 and sint256. Exponentiation power is not allowed to be a signed shielded integer type.
// Warning 10304: (107-113): Shielded integer exponentiation will leak the exponent value through gas cost.
// Warning 10403: (167-176): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (197-206): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (221-227): Built-in binary operator ** cannot be applied to types suint8 and sint16. Exponentiation power is not allowed to be a signed shielded integer type.
// Warning 10304: (221-227): Shielded integer exponentiation will leak the exponent value through gas cost.
// Warning 3149: (221-227): The result type of the exponentiation operation is equal to the type of the first operand (suint8) ignoring the (larger) type of the second operand (sint16) which might be unexpected. Silence this warning by either converting the first or the second operand to the type of the other.
// TypeError 9640: (216-228): Explicit type conversion not allowed from "suint8" to "sint256".
// Warning 10403: (281-290): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (310-318): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (305-318): Built-in binary operator ** cannot be applied to types sint16 and sint256. Exponentiation power is not allowed to be a signed shielded integer type.
// Warning 10304: (305-318): Shielded integer exponentiation will leak the exponent value through gas cost.
// Warning 3149: (305-318): The result type of the exponentiation operation is equal to the type of the first operand (sint16) ignoring the (larger) type of the second operand (sint256) which might be unexpected. Silence this warning by either converting the first or the second operand to the type of the other.
