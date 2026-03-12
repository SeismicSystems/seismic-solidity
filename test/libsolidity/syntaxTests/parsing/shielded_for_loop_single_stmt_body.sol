contract test {
    function fun(suint256 a) public {
        suint256 i = suint(0);
        for (i = suint(0); i < suint(10); i++)
            continue;
    }
}
// ----
// Warning 10403: (75-83): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (102-110): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (116-125): Literals converted to shielded integers will leak during contract deployment.
// Warning 10311: (112-125): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10302: (127-130): Shielded integer increment can leak information. A revert due to overflow reveals range information about the operand.
// Warning 5667: (33-43): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 2018: (20-159): Function state mutability can be restricted to pure
