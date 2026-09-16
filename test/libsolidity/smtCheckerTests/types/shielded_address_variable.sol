contract C {
	// Exercises SymbolicAddressVariable's dispatch path. Pre-fix isAddress
	// matched only Category::Address, so saddress fell through to the
	// abstract fallback in newSymbolicVariable and emitted "does not yet
	// support" / "does not yet implement type saddress" warnings.
	saddress sa;
	function f(saddress a) external {
		sa = a;
	}
}
// ====
// SMTEngine: bmc
// ----
