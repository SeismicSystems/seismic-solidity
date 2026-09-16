contract C {
	saddress sa;
	function check(address a) external {
		sa = saddress(a);
		address readBack = address(sa);
		// Should be provable: the round-trip through shielded storage
		// preserves the value. Pre-fix saddress routed to an abstract
		// SymbolicIntVariable and the equality wasn't tracked.
		assert(readBack == a);
	}
}
// ====
// SMTEngine: bmc
// ----
// Info 6002: BMC: 1 verification condition(s) proved safe! Enable the model checker option "show proved safe" to see all of them.
