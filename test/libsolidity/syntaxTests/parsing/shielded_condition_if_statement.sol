contract test {
    function fun(suint256 a, suint256 b) public pure returns (uint) {
        if (a >= b) { return 2; } else { return 3; }
    }
}
// ----
// Warning 9663: (98-104): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.

