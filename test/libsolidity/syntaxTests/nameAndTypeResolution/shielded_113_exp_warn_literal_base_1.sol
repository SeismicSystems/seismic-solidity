contract test {
    function f() pure public returns(suint) {
        suint8 x = 100;
        return 10**x;
    }
}
// ----
