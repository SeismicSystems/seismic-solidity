// External call return value (uint256) assigned to shielded var — no literal, no shielded-literal warning
contract Target {
    function getVal() external pure returns(uint256) { return 1; }
}

contract Caller {
    Target t;
    suint256 private val;
    function test() external {
        val = suint256(t.getVal());
    }
}
// ----
