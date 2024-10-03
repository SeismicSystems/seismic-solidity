contract C {
    function f(saddress a) public pure {
        saddress b;
        saddress payable c = a;
        c = b;
    }
}
// ----
// TypeError 9574: (80-101): Type saddress is not implicitly convertible to expected type saddress payable.
// TypeError 7407: (115-116): Type saddress is not implicitly convertible to expected type saddress payable.
