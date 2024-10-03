contract C {
    saddress payable[] a;
    saddress[] b;
    function f() public view {
        saddress payable[] storage c = a;
        saddress[] storage d = b;
        d = c; // TODO: this could be allowed in the future
    }
}
// ----
// TypeError 7407: (172-173): Type saddress payable[] storage pointer is not implicitly convertible to expected type saddress[] storage pointer.
