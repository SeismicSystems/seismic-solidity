contract c {
    suint32[] a;
    suint8[] b;
    function f() public { a = b; }
}
// ----
// Warning 9665: (17-28): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 9665: (34-44): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
