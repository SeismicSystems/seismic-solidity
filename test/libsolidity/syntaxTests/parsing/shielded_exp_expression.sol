contract test {
    function fun(suint256 a) public {
        suint256 x = 3 ** a;
    }
}
// ----
// Warning 2072: (61-70): Unused local variable.
// Warning 2018: (20-86): Function state mutability can be restricted to pure
