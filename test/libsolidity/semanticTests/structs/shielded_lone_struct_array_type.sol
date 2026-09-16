contract C {
    struct s {
        suint256 a;
        suint256 b;
    }

    function f() public returns (uint256) {
        s[7][]; // This is only the type, should not have any effect
        return 3;
    }
}
// ----
// f() -> 3
