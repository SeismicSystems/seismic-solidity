contract test { fallback() external { suint x = 3; sint y = -4; x ** y; } }
// ----
// TypeError 2271: (64-70): Built-in binary operator ** cannot be applied to types suint256 and sint256. Exponentiation power is not allowed to be a signed integer type.
