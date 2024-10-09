contract C {
    function f() public pure {
        // We allow an exception for 0
        saddress payable a = payable(saddress(0));
        a = payable(saddress(1));
        saddress payable b = payable(saddress(0x0123456789012345678901234567890123456789));
        b = payable(saddress(0x9876543210987654321098765432109876543210));
    }
}
// ----
