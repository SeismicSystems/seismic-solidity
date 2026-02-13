// Tests that == on sbytes storage refs is rejected
// Adapted from nameAndTypeResolution/202_bytes_reference_compare_operators.sol
contract test { sbytes a; sbytes b; fallback() external { a == b; } }
// ----
// TypeError 2271: (190-196): Built-in binary operator == cannot be applied to types sbytes storage ref and sbytes storage ref.
