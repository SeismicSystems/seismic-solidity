contract test { fallback() external { suint x = 1; suint y = 2; x || y; } }
// ----
// Warning 9660: (38-49): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (51-62): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (64-70): Built-in binary operator || cannot be applied to types suint256 and suint256.
