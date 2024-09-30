contract test {
    function f() public { sint x = 3; sint y = 4; x ** y; }
    function h() public { suint8 x = 3; sint16 y = 4; x ** y; }
    function i() public { sint16 x = 4; x ** -3; }
}
// ----
// Warning 9660: (42-52): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (54-64): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (66-72): Built-in binary operator ** cannot be applied to types sint256 and sint256. Exponentiation power is not allowed to be a signed shielded integer type.
// Warning 3817: (66-72): Shielded integer exponentiation will leak the exponent value through gas cost.
// Warning 9660: (102-114): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (116-128): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (130-136): Built-in binary operator ** cannot be applied to types suint8 and sint16. Exponentiation power is not allowed to be a signed shielded integer type.
// Warning 3817: (130-136): Shielded integer exponentiation will leak the exponent value through gas cost.
// Warning 3149: (130-136): The result type of the exponentiation operation is equal to the type of the first operand (suint8) ignoring the (larger) type of the second operand (sint16) which might be unexpected. Silence this warning by either converting the first or the second operand to the type of the other.
// Warning 9660: (166-178): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (180-187): Built-in binary operator ** cannot be applied to types sint16 and int_const -3. Exponentiation power is not allowed to be a negative integer literal.
