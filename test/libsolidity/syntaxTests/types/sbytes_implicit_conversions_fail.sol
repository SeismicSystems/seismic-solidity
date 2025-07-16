contract C {
    function test() internal pure {
        sbytes1 sb1 = sbytes1(0x01);
        sbytes8 sb8 = sbytes8(0x0102030405060708);
        sbytes32 sb32 = sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
        
        bytes1 b1 = bytes1(0x01);
        bytes8 b8 = bytes8(0x0102030405060708);
        bytes32 b32 = bytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
        
        // Test implicit conversions from sbytes to bytes (should fail)
        b1 = sb1;
        b8 = sb8;
        b32 = sb32;
        
        // Test implicit conversions from bytes to sbytes (should fail)
        sb1 = b1;
        sb8 = b8;
        sb32 = b32;
    }
}
// ----
// TypeError 7407: (523-526): Type sbytes1 is not implicitly convertible to expected type bytes1.
// TypeError 7407: (541-544): Type sbytes8 is not implicitly convertible to expected type bytes8.
// TypeError 7407: (560-564): Type sbytes32 is not implicitly convertible to expected type bytes32.
// TypeError 7407: (661-663): Type bytes1 is not implicitly convertible to expected type sbytes1.
// TypeError 7407: (679-681): Type bytes8 is not implicitly convertible to expected type sbytes8.
// TypeError 7407: (698-701): Type bytes32 is not implicitly convertible to expected type sbytes32.