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
// Warning 10305: (17-30): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 7407: (208-212): Type saddress[] storage pointer is not implicitly convertible to expected type address[] storage pointer.
// TypeError 7407: (229-233): Type address[] storage pointer is not implicitly convertible to expected type saddress[] storage pointer.
