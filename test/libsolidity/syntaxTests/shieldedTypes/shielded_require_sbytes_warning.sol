contract TestShieldedRequireSbytes {
    function f(sbytes4 a, sbytes4 b) public pure {
        require(a > b);
    }

    function g(sbytes4 a, sbytes4 b) public pure {
        require(a > b, "a must be greater than b");
    }
}
// ----
// Warning 10310: (104-109): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10310: (186-191): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
