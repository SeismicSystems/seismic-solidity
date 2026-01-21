contract C {
    suint256 transient public x;

    function setX(suint256 v) public {
        x = v;
    }
    function resetX() public {
        x = suint256(0);
    }
    function getX() internal view returns (suint256) {
        return x;
    }
    function checkX() public returns (uint256) {
        // Return 1 if x is zero (transient behavior working), 0 otherwise
        if (uint256(getX()) == 0) {
            return 1;
        }
        return 0;
    }
}
// ====
// EVMVersion: >=cancun
// ----
// setX(uint256): 42 ->
// checkX() -> 0
// resetX() ->
// checkX() -> 1
