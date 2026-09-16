contract TestShieldedIfConditionSbytes {
    function f(sbytes4 a, sbytes4 b) public returns (uint) {
        if (a > b) {
            return 1;
        }
        return 2;
    }

    function g(sbytes32 a, sbytes32 b) public returns (uint) {
        if (a == b) {
            return 1;
        }
        return 2;
    }
}
// ----
// Warning 10311: (114-119): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10311: (255-261): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 2018: (45-178): Function state mutability can be restricted to pure
// Warning 2018: (184-320): Function state mutability can be restricted to pure
