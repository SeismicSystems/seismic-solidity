pragma abicoder v1;
contract C {
	function f(sbool b) public pure returns (bool) { return bool(b); }
}
// ====
// ABIEncoderV1Only: true
// compileViaYul: false
// ----
// f(sbool): true -> true
// f(sbool): false -> false
// f(sbool): 0x000000 -> false
// f(sbool): 0xffffff -> true

