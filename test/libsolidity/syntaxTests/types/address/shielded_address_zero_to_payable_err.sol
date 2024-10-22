contract C {
    function f() public pure {
        saddress payable a = saddress(0);
    }
}
// ----
// TypeError 9574: (52-84): Type saddress is not implicitly convertible to expected type saddress payable.
