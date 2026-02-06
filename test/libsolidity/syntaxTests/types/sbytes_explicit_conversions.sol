
contract C {
    function test() internal pure {
        sbytes1 sb1 = sbytes1(0x01);
        sbytes8 sb8 = sbytes8(0x0102030405060708);
        sbytes32 sb32 = sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
        
        bytes1 b1 = bytes1(0x01);
        bytes8 b8 = bytes8(0x0102030405060708);
        bytes32 b32 = bytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
        
        // Test conversions from sbytes to bytes (explicit conversion allowed)
        b1 = bytes1(sb1);
        b8 = bytes8(sb8);
        b32 = bytes32(sb32);
        
        // Test conversions from bytes to sbytes (explicit conversion allowed)
        sb1 = sbytes1(b1);
        sb8 = sbytes8(b8);
        sb32 = sbytes32(b32);
    }
}
// ----
// Warning 9663: (58-85): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (95-136): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (146-238): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.