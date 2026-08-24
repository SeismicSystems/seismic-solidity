contract C {
    function f(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 sum = a + b;
        uint256 diff = a - b;
        uint256 prod = a * b;
        uint256 quot = a / b;
        uint256 rem = a % b;
        return sum + diff + prod + quot + rem;
    }
}
// ----
