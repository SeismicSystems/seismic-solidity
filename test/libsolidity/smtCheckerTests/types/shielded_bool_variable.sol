contract C {
	// Exercises SymbolicBoolVariable's constructor, which previously
	// solAsserted m_type->category() == Bool exactly. Even just declaring
	// an sbool variable triggers this once isBool is widened to accept
	// ShieldedBool.
	sbool flag;
	function f(bool b) external {
		flag = sbool(b);
	}
}
// ====
// SMTEngine: bmc
// ----
