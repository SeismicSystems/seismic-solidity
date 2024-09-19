contract test { fallback() external { suint x = 1; !x; } }
// ----
// TypeError 4907: (50-52): Built-in unary operator ! cannot be applied to type suint256.
