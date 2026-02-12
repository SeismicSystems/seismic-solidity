contract C {
    function returnSbytes1() internal pure returns (sbytes1) {
        return sbytes1(0x01);
    }
    
    function returnSbytes8() internal pure returns (sbytes8) {
        return sbytes8(0x0102030405060708);
    }
    
    function returnSbytes32() internal pure returns (sbytes32) {
        return sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
    }
    
    function test() internal pure {
        sbytes1 sb1 = returnSbytes1();
        sbytes8 sb8 = returnSbytes8();
        sbytes32 sb32 = returnSbytes32();
        
        // Test chaining function calls
        sbytes1 chained = sbytes1(returnSbytes8());
        sbytes32 expanded = sbytes32(returnSbytes1());
    }
}

// ----
// Warning 9663: (91-104): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (195-222): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (315-391): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 2072: (448-459): Unused local variable.
// Warning 2072: (487-498): Unused local variable.
// Warning 2072: (526-539): Unused local variable.
// Warning 2072: (617-632): Unused local variable.
// Warning 2072: (669-686): Unused local variable.
