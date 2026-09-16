contract C {
	// Exercises SMTEncoder::arithmeticOperation, which previously
	// solAsserted on commonType->category() == Integer || FixedPoint.
	// ShieldedIntegerType returns Category::ShieldedInteger, causing
	// an internal compiler error on any suint binary op.
	function addInternal(suint256 a, suint256 b) internal pure returns (suint256) {
		return a + b;
	}

	function f(suint256 a, suint256 b) external pure returns (uint256) {
		// Cast to unshielded at the boundary; the inner add() exercises the
		// shielded arithmetic path that previously crashed SMTChecker.
		return uint256(addInternal(a, b));
	}
}
// ====
// SMTEngine: bmc
// ----
// Warning 10301: (357-362): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
// Warning 2661: (357-362): BMC: Overflow (resulting value larger than 2**256 - 1) happens here.
