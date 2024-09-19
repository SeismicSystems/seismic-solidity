contract c {
    suint32[] a;
    suint8[] b;
    function f() public { b = a; }
}
// ----
// TypeError 7407: (74-75): Type suint32[] storage ref is not implicitly convertible to expected type suint8[] storage ref.
