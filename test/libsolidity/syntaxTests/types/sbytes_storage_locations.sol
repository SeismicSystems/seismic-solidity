contract C {
    sbytes1 sb1_storage;
    sbytes8 sb8_storage;
    sbytes32 sb32_storage;
    
    function test() internal pure {
        sbytes1 sb1_local;
        sbytes8 sb8_local;
        sbytes32 sb32_local;
        
        // Type conversions between different sbytes sizes
        sb1_local = sbytes1(sb8_local);
        sb8_local = sbytes8(sb32_local);
        sb32_local = sbytes32(sb1_local);
        
        // Function parameters
        testParams(sb1_local, sb8_local, sb32_local);
    }
    
    function testParams(sbytes1 sb1_param, sbytes8 sb8_param, sbytes32 sb32_param) internal pure {
        sbytes1 local1 = sb1_param;
        sbytes8 local8 = sb8_param;
        sbytes32 local32 = sb32_param;
    }
}
// ----
// Warning 2072: (617-631): Unused local variable.
// Warning 2072: (653-667): Unused local variable.
// Warning 2072: (689-705): Unused local variable.