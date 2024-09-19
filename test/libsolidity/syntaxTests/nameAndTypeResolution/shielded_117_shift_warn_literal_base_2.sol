contract test {
    function f() pure public returns(suint) {
        suint8 x = 100;
        return suint8(10) << x;
    }
}
// ----
