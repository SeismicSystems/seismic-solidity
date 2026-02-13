contract test { fallback() external { suint x = suint(3); sint y = sint(-4); x ** y; } }
// ----
// Warning 9660: (48-56): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (67-75): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (77-83): Built-in binary operator ** cannot be applied to types suint256 and sint256. Exponentiation power is not allowed to be a signed shielded integer type.
// Warning 3817: (77-83): Shielded integer exponentiation will leak the exponent value through gas cost.
