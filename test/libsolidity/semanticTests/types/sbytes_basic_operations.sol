contract C {
    sbytes private data;
    
    function testAssignment() public {
        data = sbytes("hello");
        assert(data.length == 5);
    }
    
    function testConversion() public {
        bytes memory normalBytes = "world";
        sbytes memory shieldedBytes = sbytes(normalBytes);
        bytes memory converted = bytes(shieldedBytes);
        assert(converted.length == 5);
    }
}
// ----
// testAssignment() ->
// testConversion() ->