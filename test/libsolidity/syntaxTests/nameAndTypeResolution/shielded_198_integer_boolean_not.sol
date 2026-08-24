contract test { fallback() external { suint x = suint(1); !x; } }
// ----
// Warning 10403: (48-56): Literals converted to shielded integers will leak during contract deployment.
// TypeError 4907: (58-60): Built-in unary operator ! cannot be applied to type suint256.
