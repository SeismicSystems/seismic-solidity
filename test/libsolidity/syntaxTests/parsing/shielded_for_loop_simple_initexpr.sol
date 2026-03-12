contract test {
    function fun(suint256 a) public {
        suint256 i =suint256(0);
        for (i; i < suint(10); i++) {
            suint256 x = i; break; continue;
        }
    }
}
// ----
// Warning 9660: (74-85): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (107-116): Literals converted to shielded integers will leak during contract deployment.
// Warning 5765: (103-116): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10302: (118-121): Shielded integer increment can leak information. A revert due to overflow reveals range information about the operand.
// Warning 5740: (118-121): Unreachable code.
// Warning 5740: (160-168): Unreachable code.
// Warning 5667: (33-43): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 2072: (137-147): Unused local variable.
// Warning 2018: (20-185): Function state mutability can be restricted to pure
