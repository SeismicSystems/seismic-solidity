contract test { fallback() external { suint x = 3; sint y = -4; x ** y; } }
// ----
// Warning 9660: (38-49): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (51-62): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (64-70): Built-in binary operator ** cannot be applied to types suint256 and sint256. Exponentiation power is not allowed to be a signed shielded integer type.
// Warning 3817: (64-70): Shielded integer exponentiation will leak the exponent value through gas cost.