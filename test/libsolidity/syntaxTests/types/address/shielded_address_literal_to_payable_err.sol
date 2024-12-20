contract C {
    function f() public pure {
        saddress payable a = saddress(0x00000000219ab540356cBB839Cbe05303d7705Fa);
        saddress payable b = 0x00000000219ab540356cBB839Cbe05303d7705Fa;
    }
}
// ----
// TypeError 9574: (52-125): Type saddress is not implicitly convertible to expected type saddress payable.
// Warning 9662: (52-125): Address Literals converted to shielded addresses will leak during contract deployment.
// TypeError 9574: (135-198): Type address is not implicitly convertible to expected type saddress payable.
