contract C {
	sbytes private sb;

	function init() external {
		sb = "hi";
	}

	function get() external view returns (bytes8) {
		return bytes8(bytes(sb));
	}
}
// ----
// init() ->
// get() -> 0x6869000000000000000000000000000000000000000000000000000000000000
