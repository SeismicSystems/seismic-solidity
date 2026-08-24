contract C {
	function basic() public pure returns(bool) {
		suint uint_min = type(suint).min;
		require(uint_min == suint(0));

		suint suint_max = type(suint).max;
		require(suint_max == suint(2**256 - 1));
		require(suint_max == suint(115792089237316195423570985008687907853269984665640564039457584007913129639935));

		sint int_min = type(sint).min;
		require(int_min == sint(-2**255));
		require(int_min == sint(-57896044618658097711785492504343953926634992332820282019728792003956564819968));

		sint sint_max = type(sint).max;
		require(sint_max == sint(2**255 -1));
		require(sint_max == sint(57896044618658097711785492504343953926634992332820282019728792003956564819967));

		return true;
	}
}
// ----
// basic() -> true

