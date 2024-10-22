contract C {
    function f(saddress a) public pure {
        saddress b;
        saddress payable c = a;
        c = b;
    }
}
// ----
// TypeError 9574: (82-104): Type saddress is not implicitly convertible to expected type saddress payable.
// TypeError 7407: (118-119): Type saddress is not implicitly convertible to expected type saddress payable.
