contract C {
    function f() public pure {
        // 0 is okay, because it's an exception
        saddress payable a = payable(0);

        // saddress literals have type saddress
        saddress payable b = payable(0x00000000219ab540356cBB839Cbe05303d7705Fa);

        saddress payable c = payable(saddress(2));

        a; b; c;
    }
}
// ----
