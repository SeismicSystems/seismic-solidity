contract c {
    suint32[] a;
    suint8[80] b;
    function f() public { a = b; }
}
// ----
