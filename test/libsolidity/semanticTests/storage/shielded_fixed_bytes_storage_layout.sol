contract C {
	sbytes8 private x;

	function asmStore(bytes32 v) external {
		assembly { cstore(x.slot, v) }
	}

	function publicView() external view returns (bytes8) {
		return bytes8(x);
	}

	function rawSlot() external view returns (bytes32 r) {
		assembly { r := cload(x.slot) }
	}
}
// ====
// compileViaYul: true
// ----
// asmStore(bytes32): 0x0102030405060708000000000000000000000000000000000000000000000000 ->
// publicView() -> 0x0102030405060708000000000000000000000000000000000000000000000000
// rawSlot() -> 0x0102030405060708000000000000000000000000000000000000000000000000
