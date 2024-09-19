contract test {
    function f() public { sint x = 3; sint y = 4; x ** y; }
    function h() public { suint8 x = 3; sint16 y = 4; x ** y; }
    function i() public { sint16 x = 4; x ** -3; }
}
// ----
// TypeError 2271: (64-70): Built-in binary operator ** cannot be applied to types sint256 and sint256. Exponentiation power is not allowed to be a signed sinteger type.
// TypeError 2271: (126-132): Built-in binary operator ** cannot be applied to types suint8 and sint16. Exponentiation power is not allowed to be a signed sinteger type.
// Warning 3149: (126-132): The result type of the exponentiation operation is equal to the type of the first operand (suint8) ignoring the (larger) type of the second operand (sint16) which might be unexpected. Silence this warning by either converting the first or the second operand to the type of the other.
// TypeError 2271: (175-182): Built-in binary operator ** cannot be applied to types sint16 and sint_const -3. Exponentiation power is not allowed to be a negative sinteger literal.
