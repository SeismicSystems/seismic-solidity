contract C {
    saddress[] sa;
    address[] a;
    function f() public view {
        saddress[] storage sptr = sa;
        address[] storage aptr = a;
        // Both directions should fail
        aptr = sptr;
        sptr = aptr;
    }
}
// ----
// TypeError 7407: (208-212): Type saddress[] storage pointer is not implicitly convertible to expected type address[] storage pointer.
// TypeError 7407: (229-233): Type address[] storage pointer is not implicitly convertible to expected type saddress[] storage pointer.
