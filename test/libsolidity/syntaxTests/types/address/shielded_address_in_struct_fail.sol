contract A {
    struct S {
        saddress payable a;
    }
    S s;
    function f() public {
        s.a = saddress(this);
    }
}
// ----
// TypeError 7407: (110-123): Type saddress is not implicitly convertible to expected type saddress payable.
