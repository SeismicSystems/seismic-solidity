contract TestShieldedIfCondition {
    function f(sbool c) public returns (uint) {
        if (c) {
            return 1;
        }
        return 2;
    }

    function g(suint256 a, suint256 b) public returns (uint) {
        if (a > b) {
            return 1;
        }
        return 2;
    }
}

// ----
// Warning 5765: (95-96): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 5765: (232-237): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 2018: (39-155): Function state mutability can be restricted to pure
// Warning 2018: (161-296): Function state mutability can be restricted to pure
