contract C {
    function f() public pure {
        saddress a = saddress(0);
        a = saddress(1);
        saddress b = saddress(0x0123456789012345678901234567890123456789);
        b = saddress(0x9876543210987654321098765432109876543210);
        b = saddress(0x9876_5432_1098_7654_3210_9876_5432_1098_7654_3210);
    }
}
// ----
// Warning 9662: (111-176): Address Literals converted to shielded addresses will leak during contract deployment.
