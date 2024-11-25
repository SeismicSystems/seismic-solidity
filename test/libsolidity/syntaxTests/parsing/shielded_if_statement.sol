contract test {
    function fun(suint256 a) public returns (uint) {
        if (a >= 8) { return 2; } else { suint b = 7; }
    }
}
// ----
// Warning 9660: (110-121): Literals converted to shielded integers will leak during contract deployment.
// Warning 6321: (61-65): Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
// Warning 2072: (110-117): Unused local variable.
// Warning 2018: (20-130): Function state mutability can be restricted to pure
