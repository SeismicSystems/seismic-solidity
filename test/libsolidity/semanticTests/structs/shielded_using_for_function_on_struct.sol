// Shielded version of using_for_function_on_struct.sol
library D {
    struct s { suint256 a; }
    function mul(s storage self, uint256 x) public returns (uint256) {
        self.a = suint256(uint256(self.a) * x);
        return uint256(self.a);
    }
}
contract C {
    using D for D.s;
    D.s private x; // shielded types cannot be public
    function f(uint256 a) public returns (uint256) {
        x.a = suint256(3);
        return x.mul(a);
    }
    function getX() public view returns (uint256) {
        return uint256(x.a);
    }
}
// ----
// library: D
// f(uint256): 7 -> 0x15
// getX() -> 0x15
