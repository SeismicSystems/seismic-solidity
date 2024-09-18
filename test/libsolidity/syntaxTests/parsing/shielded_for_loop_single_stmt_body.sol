contract test {
    function fun(suint256 a) public {
        suint256 i = 0;
        for (i = 0; i < 10; i++)
            continue;
    }
}
// ----
// Warning 5667: (33-43): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 2018: (20-138): Function state mutability can be restricted to pure
