contract TestShieldedForWarnings {
    function testShieldedBool(sbool condition) public {
        for (; condition;) {
            break;
        }
    }

    function testShieldedComparison(suint counter, suint limit) public {
        for (; counter < limit;) {
            counter++;
        }
    }

    function testRegularBool(bool flag) public {
        for (; flag;) {
            break;
        }
    }

    function testRegularComparison(uint counter, uint limit) public {
        for (; counter < limit;) {
            counter++;
        }
    }
}
// ----
// Warning 9663: (106-115): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 9663: (244-259): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 2018: (39-154): Function state mutability can be restricted to pure
// Warning 2018: (160-302): Function state mutability can be restricted to pure
// Warning 2018: (308-411): Function state mutability can be restricted to pure
// Warning 2018: (417-556): Function state mutability can be restricted to pure
