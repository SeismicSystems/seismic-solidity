pragma abicoder v2;

contract C {
	function f(sbool b) public pure returns (bool) { return bool(b); }
}
// ----
// f(sbool): true -> true
// f(sbool): false -> false
// f(sbool): 0x000000 -> false
// f(sbool): 0xffffff -> FAILURE
