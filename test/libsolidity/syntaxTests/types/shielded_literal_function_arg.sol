contract C {
    function acceptShielded(suint256 a, sint256 b) internal pure returns (suint256) {
        return a;
    }

    function test() internal {
        // Pass shielded literals as function arguments
        suint256 r = acceptShielded(42s, -10s);
    }
}
// ----
// Warning 9667: (247-250): Shielded number literals will leak during contract deployment.
// Warning 9667: (253-256): Shielded number literals will leak during contract deployment.
// Warning 5667: (53-62): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 2072: (219-229): Unused local variable.
// Warning 2018: (128-264): Function state mutability can be restricted to pure
