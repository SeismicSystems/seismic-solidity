contract C {
    function f() public pure {
        saddress payable a = payable(saddress(0x00000000219ab540356cBB839Cbe05303d7705Fa));
        saddress payable b = payable(saddress(0x00000000219ab540356cBB839Cbe05303d7705Fa));
        a = b;
        b = a;
    }
}
// ----
// Warning 9662: (81-133): Address Literals converted to shielded addresses will leak during contract deployment.
// Warning 9662: (173-225): Address Literals converted to shielded addresses will leak during contract deployment.
