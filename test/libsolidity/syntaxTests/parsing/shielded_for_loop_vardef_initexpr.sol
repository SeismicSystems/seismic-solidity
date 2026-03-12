contract test {
    function fun(suint256 a) public {
        for (suint256 i = suint(0); i < suint(10); i++) {
            suint256 x = i; break; continue;
        }
    }
}
// ----
// Warning 9660: (80-88): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (94-103): Literals converted to shielded integers will leak during contract deployment.
// Warning 5765: (90-103): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10302: (105-108): Shielded integer increment can leak information. A revert due to overflow reveals range information about the operand.
// Warning 5740: (105-108): Unreachable code.
// Warning 5740: (147-155): Unreachable code.
// Warning 5667: (33-43): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 2072: (124-134): Unused local variable.
// Warning 2018: (20-172): Function state mutability can be restricted to pure
