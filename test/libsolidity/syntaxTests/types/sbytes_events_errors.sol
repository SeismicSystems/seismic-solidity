contract C {
    event DataEvent(sbytes1 id, sbytes8 hash, sbytes32 signature);
    
    error DataError(sbytes1 id, sbytes8 hash, sbytes32 signature);
    
    function test() internal pure {
        // Test event emission with sbytes
        emit DataEvent(
            sbytes1(0x01),
            sbytes8(0x0102030405060708),
            sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132)
        );
        
        // Test error revert with sbytes
        revert DataError(
            sbytes1(0xFF),
            sbytes8(0xFFFFFFFFFFFFFFFF),
            sbytes32(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
        );
    }
}
// ----
// TypeError 4626: (33-43): Shielded Types are not allowed as event parameter type.