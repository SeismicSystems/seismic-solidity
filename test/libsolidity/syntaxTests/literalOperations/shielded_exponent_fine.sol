contract C {
    function f() public pure {
        suint a;
        a = suint(a ** 1E5);
        a = suint(0 ** 1E1233);
    }
}
// ----
