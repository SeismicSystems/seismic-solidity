contract C {
    // Test that sbytes cannot be returned from external functions
    function externalSbytes1() external pure returns (sbytes1) {
        return sbytes1(0x01);
    }
    
    function externalSbytes8() external pure returns (sbytes8) {
        return sbytes8(0x0102030405060708);
    }
    
    function externalSbytes32() external pure returns (sbytes32) {
        return sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
    }
    
    // Test that sbytes cannot be returned from public functions
    function publicSbytes1() public pure returns (sbytes1) {
        return sbytes1(0x01);
    }
    
    function publicSbytes8() public pure returns (sbytes8) {
        return sbytes8(0x0102030405060708);
    }
    
    function publicSbytes32() public pure returns (sbytes32) {
        return sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
    }
}