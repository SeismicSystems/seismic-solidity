contract test { fallback() external { suint x = suint(1); suint y = suint(2); x || y; } }
// ----
// Warning 9660: (38-56): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (58-76): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (78-84): Built-in binary operator || cannot be applied to types suint256 and suint256.
