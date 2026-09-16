contract C {
    function f() public pure {
        saddress payable a = saddress(uint160(0));
        saddress payable b = saddress(bytes20(0));
        saddress payable c = saddress(this);
    }
}
// ----
// TypeError 9574: (52-93): Type saddress is not implicitly convertible to expected type saddress payable.
// TypeError 9574: (103-144): Type saddress is not implicitly convertible to expected type saddress payable.
// TypeError 9574: (154-189): Type saddress is not implicitly convertible to expected type saddress payable.
