contract C {
    function test() internal pure {
        // Explicit conversions between saddress and sbytes20 should work
        saddress a = saddress(address(0x1234567890123456789012345678901234567890));
        sbytes20 b = sbytes20(a);
        saddress c = saddress(b);
        require(address(c) == address(0x1234567890123456789012345678901234567890));
    }
}
// ----
