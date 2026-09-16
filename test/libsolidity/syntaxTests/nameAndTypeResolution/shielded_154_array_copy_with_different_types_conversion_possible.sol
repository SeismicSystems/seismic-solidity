contract c {
    suint32[] a;
    suint8[] b;
    function f() public { a = b; }
}
// ----
// Warning 10305: (17-28): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 10305: (34-44): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
