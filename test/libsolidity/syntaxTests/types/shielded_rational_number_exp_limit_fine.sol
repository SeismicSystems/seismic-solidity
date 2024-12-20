contract c {
    function f() public pure {
        sint a;
        a = sint(0 ** 1E1233);
        a = sint(1 ** 1E1233);
        a = sint(-1 ** 1E1233);
        a = sint(0E123456789);
    }
}
// ----
