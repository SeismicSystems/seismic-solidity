contract TestShieldedRequire {
    function f(sbool c) public pure {
        require(c);
    }

    function g(sbool c) public pure {
        require(c, "condition failed");
    }

    function h(suint256 a, suint256 b) public pure {
        require(a > b);
    }

    function i(suint256 a, suint256 b) public pure {
        require(a > b, "a must be greater than b");
    }
}

// ----
// Warning 10310: (85-86): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10310: (150-151): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10310: (250-255): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10310: (334-339): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
