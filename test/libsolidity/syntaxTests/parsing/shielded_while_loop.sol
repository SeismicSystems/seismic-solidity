contract test {
    function fun() public pure {
        suint256 x;
        while (true) { x = 1; break; continue; } x = 9;
    }
}
// ----
// Warning 5740: (106-114): Unreachable code.
