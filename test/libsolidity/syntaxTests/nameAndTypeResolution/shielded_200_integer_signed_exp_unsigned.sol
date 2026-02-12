contract test {
    fallback() external { suint x = suint(3); sint y = sint(-4); y ** x; }
    function f() public pure { sint16 x =sint16(3); suint8 y = suint8(4); x ** y; }
    function g() public pure { sint16 x =sint16(3); suint16 y = suint16(4); x ** y; }
}
// ----
// Warning 9660: (52-60): Literals converted to shielded integers will leak during contract deployment.
// Warning 3817: (81-87): Shielded integer exponentiation will leak the exponent value through gas cost.
// Warning 9660: (132-141): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (154-163): Literals converted to shielded integers will leak during contract deployment.
// Warning 3817: (165-171): Shielded integer exponentiation will leak the exponent value through gas cost.
// Warning 9660: (216-225): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (239-249): Literals converted to shielded integers will leak during contract deployment.
// Warning 3817: (251-257): Shielded integer exponentiation will leak the exponent value through gas cost.
