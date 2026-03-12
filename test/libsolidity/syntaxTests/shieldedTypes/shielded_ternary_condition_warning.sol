contract TestShieldedTernaryCondition {
    function f(sbool c) public pure returns (uint) {
        return c ? 1 : 2;
    }

    function g(suint256 a, suint256 b) public pure returns (uint) {
        return a > b ? 1 : 2;
    }
}

// ----
// Warning 10311: (108-109): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10311: (209-214): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
