contract test {
    function fun(suint256 a) public returns (suint) {
        if (a >= 8) { return 2; } else { suint b = 7; }
    }
}
// ----
// Warning 9660: (111-122): Literals converted to shielded integers will leak during contract deployment.
// Warning 6321: (61-66): Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
// Warning 2072: (111-118): Unused local variable.
// Warning 2018: (20-131): Function state mutability can be restricted to pure
