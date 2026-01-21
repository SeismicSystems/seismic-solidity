contract C {
    suint256 transient x;

    function setAndCheck(uint256 v) public returns (uint256) {
        x = suint256(v);
        return uint256(x);
    }
    function checkX() public view returns (uint256) {
        return uint256(x);
    }
}
// ====
// EVMVersion: >=cancun
// ----
// setAndCheck(uint256): 42 -> 42
// checkX() -> 0
