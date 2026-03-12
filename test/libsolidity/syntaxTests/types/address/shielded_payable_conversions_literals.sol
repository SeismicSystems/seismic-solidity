contract C {
    function f() public pure {
        // 0 is okay, because it's an exception
        saddress payable a = payable(saddress(0));

        saddress payable b = payable(saddress(0x00000000219ab540356cBB839Cbe05303d7705Fa));

        saddress payable c = payable(saddress(2));

        a; b; c;
    }
}
// ----
// Warning 10409: (181-233): Address Literals converted to shielded addresses will leak during contract deployment.
