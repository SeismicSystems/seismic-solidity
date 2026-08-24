contract C {
    function f() public pure {
        saddress payable a = payable(saddress(uint160(0)));
        saddress payable b = payable(saddress(bytes20(0)));
        saddress payable c = payable(saddress(2));
        // hex literal that is only 15 bytes long
        saddress payable d = payable(saddress(0x002190356cBB839Cbe05303d7705Fa));

        uint160 a1 = uint160(saddress(payable(0)));
        bytes20 b1 = bytes20(saddress(payable(0)));

        a; b; c; d; a1; b1;
    }
}
// ----
