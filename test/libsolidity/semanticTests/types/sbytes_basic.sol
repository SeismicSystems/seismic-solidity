contract C {
    function basic() public pure returns(bool) {
        // Test basic sbytes declarations and assignments
        sbytes1 sb1 = sbytes1(0x01);
        require(sb1 == sbytes1(0x01));
        
        sbytes8 sb8 = sbytes8(0x0102030405060708);
        require(sb8 == sbytes8(0x0102030405060708));
        
        sbytes32 sb32 = sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
        require(sb32 == sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132));
        
        return true;
    }
    
    function conversions() public pure returns(bool) {
        // Test conversions between sbytes and bytes
        sbytes1 sb1 = sbytes1(0x01);
        bytes1 b1 = bytes1(sb1);
        require(b1 == bytes1(0x01));
        
        sbytes8 sb8 = sbytes8(0x0102030405060708);
        bytes8 b8 = bytes8(sb8);
        require(b8 == bytes8(0x0102030405060708));
        
        // Test conversions from bytes to sbytes
        bytes1 b1_orig = bytes1(0xFF);
        sbytes1 sb1_conv = sbytes1(b1_orig);
        require(sb1_conv == sbytes1(0xFF));
        
        return true;
    }
}
// ----
// basic() -> true
// conversions() -> true