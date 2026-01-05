contract TestShieldedConditionalWarnings {
    function testShieldedBool(sbool condition) public pure returns (uint) {
        return condition ? 1 : 2;
    }

    function testShieldedComparison(suint a, suint b) public pure returns (uint) {
        return a >= b ? 100 : 50;
    }

    function testRegularBool(bool flag) public pure returns (uint) {
        return flag ? 1 : 2;
    }

    function testRegularComparison(uint a, uint b) public pure returns (uint) {
        return a >= b ? 100 : 50;
    }
}
// ----
// Warning 9663: (134-143): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 9663: (258-264): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
