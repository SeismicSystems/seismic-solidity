contract C {
    saddress payable[] a;
    saddress[] b;
    function f() public view {
        saddress payable[] storage c = a;
        saddress[] storage d = b;
        c = d;
    }
}
// ----
// TypeError 7407: (172-173): Type saddress[] storage pointer is not implicitly convertible to expected type saddress payable[] storage pointer.
