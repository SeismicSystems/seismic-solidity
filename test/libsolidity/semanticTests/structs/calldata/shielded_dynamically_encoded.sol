pragma abicoder               v2;

contract C {
	struct S { suint256[] a; }
	function f(S calldata s) external pure returns (uint256 a, uint256 b, uint256 c) {
	    return (uint256(s.a.length), uint256(s.a[0]), uint256(s.a[1]));
	}
}
// ----
// f((suint256[])): 32, 32, 2, 42, 23 -> 2, 42, 23
