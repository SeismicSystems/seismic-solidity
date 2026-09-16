contract C {
	function vacuity(uint256 v) external pure {
		suint8 s = suint8(v);
		uint256 o = uint256(s);
		o;
		require(v >= 256);
		// Reachable (suint8(v) wraps to v % 256), so this must be flagged.
		// Pre-fix suint8 was sized by storageBytes() == 32, modeling the cast
		// as a no-wrap same-size op; the path was pruned as contradictory and
		// the assert vacuously "proved safe".
		assert(1 == 2);
	}
}
// ====
// SMTEngine: chc
// ----
// Warning 6328: (393-407): CHC: Assertion violation happens here.
