pragma abicoder               v2;

contract C {
	struct S2 { suint256 b; }
	struct S { suint256 a; S2[] children; }
	function f(S calldata s) external pure returns (uint256, uint256, uint256, uint256) {
		return (uint256(s.children.length), uint256(s.a), uint256(s.children[0].b), uint256(s.children[1].b));
	}
}
// ----
// f((suint256,(suint256)[])): 32, 17, 64, 2, 23, 42 -> 2, 17, 23, 42
