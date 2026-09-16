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
// Warning 10305: (17-37): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 10305: (43-55): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 7407: (176-177): Type saddress[] storage pointer is not implicitly convertible to expected type saddress payable[] storage pointer.
