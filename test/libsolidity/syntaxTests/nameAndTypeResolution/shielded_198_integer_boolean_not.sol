contract test { fallback() external { suint x = 1; !x; } }
// ----
// TypeError 4907: (51-53): Built-in unary operator ! cannot be applied to type suint256.
