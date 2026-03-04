contract test {
    suint8 x;
    suint v;
    function f() public returns (uint) {
        suint a = suint(6);
        suint r = a;
        r += (a++) * suint(0x10);
        r += (++a) * suint(0x100);
        v = suint(3);
        r += (v++) * suint(0x1000);
        r += (++v) * suint(0x10000);
        return uint(r);
    }
}
// ----
// f() -> 0x053866
