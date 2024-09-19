contract test { fallback() external { suint x = 1; suint y = 2; x || y; } }
// ----
// TypeError 2271: (62-68): Built-in binary operator || cannot be applied to types suint256 and suint256.
