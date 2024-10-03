contract C {
    function f() public pure {
        saddress payable a = payable(saddress(0x00000000219ab540356cBB839Cbe05303d7705Fa));
        saddress payable b = payable(0x00000000219ab540356cBB839Cbe05303d7705Fa);
        a = b;
        b = a;
    }
}
// ----
