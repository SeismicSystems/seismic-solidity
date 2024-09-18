contract test {
    function fun(suint256 a) public {
        for (suint256 i = 0; i < 10; i++) {
            suint256 x = i; break; continue;
        }
    }
}
// ----
//Warning 5740: (91-94): Unreachable code.
//Warning 5740: (133-141): Unreachable code.
//Warning 5667: (33-43): Unused function parameter. Remove or comment out the variable name to silence this warning.
//Warning 2072: (110-120): Unused local variable.
//Warning 2018: (20-158): Function state mutability can be restricted to pure
