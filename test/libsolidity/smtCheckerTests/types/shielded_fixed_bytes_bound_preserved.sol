contract C {
	sbytes32 private secret;
	function check(bytes32 b) external {
		secret = sbytes32(b);
		bytes32 readBack = bytes32(secret);
		// The shielded round-trip must preserve `readBack == b`. Without the
		// SymbolicTypes.cpp predicate widening, the sbytes32 hop is unmodelled
		// and the assertion is reported as possibly violated.
		assert(readBack == b);
	}
}
// ====
// SMTEngine: bmc
// ----
// Info 6002: BMC: 1 verification condition(s) proved safe! Enable the model checker option "show proved safe" to see all of them.
