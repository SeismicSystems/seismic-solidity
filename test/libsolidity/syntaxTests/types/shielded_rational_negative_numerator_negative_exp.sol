contract C {
    function f() public pure returns (int) {
        return int((-1 / 2) ** -1);
    }
}
// ----
