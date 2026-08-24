contract C {
	suint256 private secret;
	function check(uint256 v) external {
		// Provably in [0, 255]: v % 256 cannot exceed 255.
		uint256 safe = v % 256;
		secret = suint256(safe);
		uint256 readBack = uint256(secret);
		// Should be provable: the bound on `safe` must propagate through
		// the shielded round-trip. The bug: the suint256 hop is unmodelled
		// by SMTChecker (predicates in SymbolicTypes.cpp drop ShieldedInteger),
		// so the modulo bound is lost and the assertion is reported as
		// possibly violated.
		assert(readBack < 256);
	}
}
// ====
// SMTEngine: bmc
// ----
// Info 6002: BMC: 2 verification condition(s) proved safe! Enable the model checker option "show proved safe" to see all of them.
