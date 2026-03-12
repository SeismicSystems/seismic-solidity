contract TestShieldedWhileConditionSbytes {
    function f(sbytes4 a, sbytes4 b) public returns (uint) {
        uint i = 0;
        while (a > b) {
            i++;
            if (i > 10) break;
        }
        return i;
    }
}
// ----
// Warning 10311: (140-145): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 2018: (48-230): Function state mutability can be restricted to pure
