contract C {
	suint256[] a;
	uint128[] b;

	function exploit() external returns (uint128) {
		delete a;
		b.push(uint128(0xAA));
		b.push(uint128(0xBB));
		b.push(uint128(0xCC));
		b.push(uint128(0xDD));
		uint128[] memory s = new uint128[](1);
		s[0] = 0x99;
		b = s;
		return b[0];
	}
}
// ====
// compileViaYul: true
// ----
// exploit() -> 0x99
