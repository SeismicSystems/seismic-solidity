contract c {
    bytes a;
    suint[] b;
    function f() public { b = a; }
}
// ----
// Warning 10305: (30-39): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 7407: (71-72): Type bytes storage ref is not implicitly convertible to expected type suint256[] storage ref.
