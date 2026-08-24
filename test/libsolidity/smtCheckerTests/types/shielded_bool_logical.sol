contract C {
	// Exercises booleanOperation, which previously solAsserted
	// commonType->category() == Bool exactly. sbool && sbool is allowed by
	// the type checker (inherited BoolType::binaryOperatorResult) but
	// crashed the SMT checker.
	function andOp(sbool a, sbool b) external pure returns (bool) {
		return bool(a && b);
	}

	function orOp(sbool a, sbool b) external pure returns (bool) {
		return bool(a || b);
	}
}
// ====
// SMTEngine: bmc
// ----
