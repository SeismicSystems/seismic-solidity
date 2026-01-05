contract TestShieldedIfWarnings {
    function testShieldedBool(sbool condition) public {
        if (condition) {
            uint x = 1;
        }
    }

    function testShieldedComparison(suint a, suint b) public {
        if (a >= b) {
            uint x = 1;
        }
    }

    function testRegularBool(bool flag) public {
        if (flag) {
            uint x = 1;
        }
    }

    function testRegularComparison(uint a, uint b) public {
        if (a >= b) {
            uint x = 1;
        }
    }
}
// ----
// Warning 9663: (102-111): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 9663: (231-237): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 2072: (127-133): Unused local variable.
// Warning 2072: (253-259): Unused local variable.
// Warning 2072: (363-369): Unused local variable.
// Warning 2072: (486-492): Unused local variable.
// Warning 2018: (38-154): Function state mutability can be restricted to pure
// Warning 2018: (160-280): Function state mutability can be restricted to pure
// Warning 2018: (286-390): Function state mutability can be restricted to pure
// Warning 2018: (396-513): Function state mutability can be restricted to pure
