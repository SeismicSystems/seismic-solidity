contract C {
    function f() public pure {
        saddress payable a = saddress(0x00000000219ab540356cBB839Cbe05303d7705Fa);
        saddress payable b = 0x00000000219ab540356cBB839Cbe05303d7705Fa;
    }
}
// ----
// TypeError 9574: (52-123): Type saddress is not implicitly convertible to expected type saddress payable.
// TypeError 9574: (133-195): Type saddress is not implicitly convertible to expected type saddress payable.
