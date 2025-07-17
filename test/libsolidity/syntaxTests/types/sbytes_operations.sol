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

        // Test comparisons
        bool eq = sb1 == sbytes1(0x01);
        bool neq = sb8 != sbytes8(0x0000000000000000);
        bool lt = sb1 < sbytes1(0xFF);
        bool lte = sb8 <= sbytes8(0xFFFFFFFFFFFFFFFF);
        bool gt = sb32 > sbytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        bool gte = sb32 >= sbytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
    }
}
// ----
// Warning 2072: (291-306): Unused local variable.
// Warning 2072: (338-353): Unused local variable.
// Warning 2072: (399-416): Unused local variable.
// Warning 2072: (541-553): Unused local variable.
// Warning 2072: (570-582): Unused local variable.
// Warning 2072: (599-613): Unused local variable.
// Warning 2072: (660-667): Unused local variable.
// Warning 2072: (700-708): Unused local variable.
// Warning 2072: (755-762): Unused local variable.
// Warning 2072: (794-802): Unused local variable.
// Warning 2072: (849-856): Unused local variable.
// Warning 2072: (952-960): Unused local variable.