contract test {
    function fun(suint256 a) public {
        suint256 i = suint(0);
        for (i = suint(0); i < suint(10); i++)
            continue;
    }
}
// ----
// Warning 9660: (62-83): Literals converted to shielded integers will leak during contract deployment.
// Warning 4283: (127-130): Shielded integer increment can leak information. A revert due to overflow reveals range information about the operand.
// Warning 5667: (33-43): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 2018: (20-159): Function state mutability can be restricted to pure
