contract c {
    suint[] a;
    suint[80] b;
    function f() public { b = a; }
}
// ----
// TypeError 7407: (73-74): Type suint256[] storage ref is not implicitly convertible to expected type suint256[80] storage ref.
