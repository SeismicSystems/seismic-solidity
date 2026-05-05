contract C {
	sbytes private secret;

	function init() external {
		secret.push(sbytes1(0xAA));
	}

	function getSecret() internal returns (bytes storage r, uint) {
		r = bytes(secret);
		return (r, 1);
	}

	function g() external {
		bytes storage ref;
		uint x;
		(ref, x) = getSecret();
		ref.push(0x42);
	}

	function len() external view returns (uint256) {
		return uint256(secret.length);
	}
}
// ----
// init() ->
// g() ->
// len() -> 2
