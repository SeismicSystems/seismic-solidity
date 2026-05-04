contract C {
	// Exercises visitTypeConversion's size-mismatch branches at lines 1193
	// and 1233. bool storageBytes == 1, sbool == 32, so any bool<->sbool
	// cast lands in a size-changing branch that solAsserts the target type
	// is a number — neither bool nor sbool is.
	function up(bool b) external pure returns (bool) {
		// bool -> sbool -> bool round-trip; should preserve the value.
		sbool s = sbool(b);
		bool r = bool(s);
		assert(r == b);
		return r;
	}
}
// ====
// SMTEngine: bmc
// ----
// Info 6002: BMC: 1 verification condition(s) proved safe! Enable the model checker option "show proved safe" to see all of them.
