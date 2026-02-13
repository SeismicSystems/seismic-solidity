contract test {
    function fun(suint256 a) public {
        suint256 i = suint(0);
        for (i = suint(0); i < suint(10); i++)
            continue;
    }
}
// ----
// Warning 9660: (75-83): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (102-110): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (116-125): Literals converted to shielded integers will leak during contract deployment.
// Warning 5667: (33-43): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 2018: (20-159): Function state mutability can be restricted to pure
