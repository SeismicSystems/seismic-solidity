contract C {
	// Exercises arithmeticOperation's helper, which previously solAsserted
	// commonType == Integer || FixedPoint exactly. suint pre/post-increment
	// and decrement reach this site.
	function incInternal(suint256 x) internal pure returns (suint256) {
		x++;
		return x;
	}

	function decInternal(suint256 x) internal pure returns (suint256) {
		--x;
		return x;
	}

	function f(suint256 x) external pure returns (uint256) {
		return uint256(incInternal(x));
	}

	function g(suint256 x) external pure returns (uint256) {
		return uint256(decInternal(x));
	}
}
// ====
// SMTEngine: bmc
// ----
// Warning 10302: (266-269): Shielded integer increment can leak information. A revert due to overflow reveals range information about the operand.
// Warning 10302: (358-361): Shielded integer decrement can leak information. A revert due to overflow reveals range information about the operand.
// Warning 2661: (266-269): BMC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 4144: (358-361): BMC: Underflow (resulting value less than 0) happens here.
