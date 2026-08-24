contract C {
	sbytes private secret;

	function init() external {
		secret.push(sbytes1(0xAA));
	}

	function getSecret() internal view returns (sbytes storage r, uint) {
		r = secret;
		return (r, 1);
	}

	function g() external {
		sbytes storage ref;
		uint x;
		(ref, x) = getSecret();
		ref.push(sbytes1(0x42));
	}

	function len() external view returns (uint256) {
		return uint256(secret.length);
	}
}
// ----
// init() ->
// g() ->
// len() -> 2
