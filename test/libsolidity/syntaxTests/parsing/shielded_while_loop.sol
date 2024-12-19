contract test {
    function fun() public pure {
        suint256 x;
        while (true) { x = suint(1); break; continue; } x = suint(9);
    }
}
// ----
// Warning 5740: (113-121): Unreachable code.
