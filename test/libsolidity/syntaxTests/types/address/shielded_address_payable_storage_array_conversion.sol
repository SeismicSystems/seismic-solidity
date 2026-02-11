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
// Warning 9665: (17-37): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 9665: (43-55): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 7407: (176-177): Type saddress payable[] storage pointer is not implicitly convertible to expected type saddress[] storage pointer.
