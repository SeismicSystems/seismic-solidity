contract test {
    function fun(suint256 a) public {
        suint256 i =0;
        for (i = 0; i < 10; i++) {
            suint256 x = i; break; continue;
        }
    }
}
// ----
// Warning 5740: (105-108): Unreachable code.
// Warning 5740: (147-155): Unreachable code.
// Warning 5667: (33-43): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 2072: (124-134): Unused local variable.
// Warning 2018: (20-172): Function state mutability can be restricted to pure
