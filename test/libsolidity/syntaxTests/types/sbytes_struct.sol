contract C {
    struct Data {
        sbytes1 id;
        sbytes8 hash;
        sbytes32 signature;
        uint256 timestamp;
    }
    
    function test() internal pure {
        // Test struct with sbytes fields
        Data memory data;
        data.id = sbytes1(0x01);
        data.hash = sbytes8(0x0102030405060708);
        data.signature = sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
        data.timestamp = 123456789;
        
        // Test struct initialization
        Data memory data2 = Data({
            id: sbytes1(0xFF),
            hash: sbytes8(0xFFFFFFFFFFFFFFFF),
            signature: sbytes32(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
            timestamp: 987654321
        });
        
        // Test struct field access
        sbytes1 readId = data2.id;
        sbytes8 readHash = data2.hash;
        sbytes32 readSig = data2.signature;
    }
}
// ----
// Warning 9663: (261-274): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (296-323): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (350-426): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (562-575): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (595-622): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (647-723): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 2072: (823-837): Unused local variable.
// Warning 2072: (858-874): Unused local variable.
// Warning 2072: (897-913): Unused local variable.
