contract c {
    suint[] a;
    suint[80] b;
    function f() public { b = a; }
}
// ----
// Warning 10305: (17-26): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 7407: (75-76): Type suint256[] storage ref is not implicitly convertible to expected type suint256[80] storage ref.
