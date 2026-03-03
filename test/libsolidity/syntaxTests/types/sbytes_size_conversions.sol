contract C {
    function test() internal pure {
        sbytes1 sb1 = sbytes1(0x01);
        sbytes8 sb8 = sbytes8(0x0102030405060708);
        sbytes32 sb32 = sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
        
        // Test implicit conversions between sbytes sizes (smaller to larger should work)
        sb8 = sb1;   // sbytes1 -> sbytes8 (implicit allowed)
        sb32 = sb1;  // sbytes1 -> sbytes32 (implicit allowed)
        sb32 = sb8;  // sbytes8 -> sbytes32 (implicit allowed)
        
        // Test implicit conversions between sbytes sizes (larger to smaller should fail)
        sb1 = sb8;   // sbytes8 -> sbytes1 (implicit not allowed)
        sb1 = sb32;  // sbytes32 -> sbytes1 (implicit not allowed)
        sb8 = sb32;  // sbytes32 -> sbytes8 (implicit not allowed)
    }
}
// ----
// Warning 9663: (71-84): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (108-135): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (161-237): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// TypeError 7407: (639-642): Type sbytes8 is not implicitly convertible to expected type sbytes1.
// TypeError 7407: (705-709): Type sbytes32 is not implicitly convertible to expected type sbytes1.
// TypeError 7407: (772-776): Type sbytes32 is not implicitly convertible to expected type sbytes8.
