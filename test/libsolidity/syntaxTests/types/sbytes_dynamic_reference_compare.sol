// Tests that == on sbytes storage refs is rejected
// Adapted from nameAndTypeResolution/202_bytes_reference_compare_operators.sol
contract test { sbytes a; sbytes b; fallback() external { a == b; } }
// ----
// Warning 10305: (148-156): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 10305: (158-166): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 2271: (190-196): Built-in binary operator == cannot be applied to types sbytes storage ref and sbytes storage ref.
