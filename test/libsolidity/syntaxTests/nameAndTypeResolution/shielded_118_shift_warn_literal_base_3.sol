contract test {
    function f() pure public returns(uint) {
        return uint(2 << 80);
    }
}
// ----
