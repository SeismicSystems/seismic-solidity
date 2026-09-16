contract C {
	sbytes private s;

	function init() external {
		s = "hello";
	}

	function mutate() external {
		s.push(sbytes1(0x41));
	}

	function len() external view returns (uint256) {
		return uint256(s.length);
	}
}
// ----
// init() ->
// mutate() ->
// len() -> 6
