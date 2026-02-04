contract C {
    function test() internal pure {
        sbytes1 sb1 = sbytes1(0x01);
        sbytes8 sb8 = sbytes8(0x0102030405060708);
        sbytes32 sb32 = sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
        
        // Test bitwise operations
        sbytes1 result1 = sb1 & sbytes1(0xFF);
        sbytes8 result8 = sb8 | sbytes8(0x0F0F0F0F0F0F0F0F);
        sbytes32 result32 = sb32 ^ sbytes32(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);

        // Test bitwise NOT
        sbytes1 not1 = ~sb1;
        sbytes8 not8 = ~sb8;
        sbytes32 not32 = ~sb32;

        // Test comparisons - shielded type comparisons return sbool
        sbool eq = sb1 == sbytes1(0x01);
        sbool neq = sb8 != sbytes8(0x0000000000000000);
        sbool lt = sb1 < sbytes1(0xFF);
        sbool lte = sb8 <= sbytes8(0xFFFFFFFFFFFFFFFF);
        sbool gt = sb32 > sbytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        sbool gte = sb32 >= sbytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
    }
}
// ----
// Warning 9663: (57-84): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (94-135): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (145-237): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 2072: (291-306): Unused local variable.
// Warning 2072: (338-353): Unused local variable.
// Warning 2072: (399-416): Unused local variable.
// Warning 2072: (541-553): Unused local variable.
// Warning 2072: (570-582): Unused local variable.
// Warning 2072: (599-613): Unused local variable.
// Warning 2072: (701-709): Unused local variable.
// Warning 2072: (742-751): Unused local variable.
// Warning 2072: (798-806): Unused local variable.
// Warning 2072: (838-847): Unused local variable.
// Warning 2072: (894-902): Unused local variable.
// Warning 2072: (998-1007): Unused local variable.