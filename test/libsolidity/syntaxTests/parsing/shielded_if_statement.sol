contract test {
    function fun(suint256 a) public returns (uint) {
        if (a >= suint(8)) { return 2; } else { suint b = suint(7); }
    }
}
// ----
// Warning 10403: (86-94): Literals converted to shielded integers will leak during contract deployment.
// Warning 10311: (81-94): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10403: (127-135): Literals converted to shielded integers will leak during contract deployment.
// Warning 6321: (61-65): Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
// Warning 2072: (117-124): Unused local variable.
// Warning 2018: (20-144): Function state mutability can be restricted to pure
