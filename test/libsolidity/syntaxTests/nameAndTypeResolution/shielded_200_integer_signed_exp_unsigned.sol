contract test {
    fallback() external { suint x = 3; sint y = -4; y ** x; }
    function f() public pure { sint16 x = 3; suint8 y = 4; x ** y; }
    function g() public pure { sint16 x = 3; suint16 y = 4; x ** y; }
}
// ----
// Warning 9660: (42-53): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (55-66): Literals converted to shielded integers will leak during contract deployment.
// Warning 3817: (68-74): Shielded integer exponentiation will leak the exponent value through gas cost.
// Warning 9660: (109-121): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (123-135): Literals converted to shielded integers will leak during contract deployment.
// Warning 3817: (137-143): Shielded integer exponentiation will leak the exponent value through gas cost.
// Warning 9660: (178-190): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (192-205): Literals converted to shielded integers will leak during contract deployment.
// Warning 3817: (207-213): Shielded integer exponentiation will leak the exponent value through gas cost.