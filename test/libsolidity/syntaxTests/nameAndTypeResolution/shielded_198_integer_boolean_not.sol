contract test { fallback() external { suint x = 1; !x; } }
// ----
// Warning 9660: (38-49): Literals converted to shielded integers will leak during contract deployment.
// TypeError 4907: (51-53): Built-in unary operator ! cannot be applied to type suint256.
