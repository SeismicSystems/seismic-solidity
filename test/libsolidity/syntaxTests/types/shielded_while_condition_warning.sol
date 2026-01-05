contract TestShieldedWhileWarnings {
    function testShieldedBool(sbool condition) public {
        while (condition) {
            break;
        }
    }

    function testShieldedComparison(suint counter, suint limit) public {
        while (counter < limit) {
            counter++;
        }
    }

    function testRegularBool(bool flag) public {
        while (flag) {
            break;
        }
    }

    function testRegularComparison(uint counter, uint limit) public {
        while (counter < limit) {
            counter++;
        }
    }
}
// ----
// Warning 9663: (108-117): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 9663: (245-260): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 2018: (41-155): Function state mutability can be restricted to pure
// Warning 2018: (161-302): Function state mutability can be restricted to pure
// Warning 2018: (308-410): Function state mutability can be restricted to pure
// Warning 2018: (416-554): Function state mutability can be restricted to pure
