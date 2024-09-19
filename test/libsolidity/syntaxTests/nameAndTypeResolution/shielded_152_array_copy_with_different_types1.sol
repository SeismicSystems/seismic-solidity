contract c {
    bytes a;
    suint[] b;
    function f() public { b = a; }
}
// ----
// TypeError 7407: (70-71): Type bytes storage ref is not implicitly convertible to expected type suint256[] storage ref.
