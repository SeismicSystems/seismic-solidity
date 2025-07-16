contract C {
    sstring private data;
    
    function testAssignment() public {
        data = sstring("hello");
        assert(bytes(string(data)).length == 5);
    }
    
    function testConversion() public {
        string memory normalString = "world";
        sstring memory shieldedString = sstring(normalString);
        string memory converted = string(shieldedString);
        assert(bytes(converted).length == 5);
    }
}
// ----
// testAssignment() ->
// testConversion() ->