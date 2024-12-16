pragma abicoder               v2;

contract C {
    function gggg(sbool x) external pure returns (bool) {
        return x;
    }
    function f(uint256 a) external view returns (bool) {
        sbool x = false;
        assembly { x := a }
        return this.gggg(x);
    }
}
// ----
// f(uint256): 0 -> false
// gggg(sbool): 0 -> false # test validation as well as sanity check #
// f(uint256): 1 -> true
// gggg(sbool): 1 -> true
// f(uint256): 2 -> true
// gggg(sbool): 2 -> FAILURE
// f(uint256): 0x1000 -> true
// gggg(sbool): 0x1000 -> FAILURE

