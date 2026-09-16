contract c {
    suint32[] a;
    suint8[] b;
    function f() public { b = a; }
}
// ----
// Warning 10305: (17-28): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 10305: (34-44): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 7407: (76-77): Type suint32[] storage ref is not implicitly convertible to expected type suint8[] storage ref.
