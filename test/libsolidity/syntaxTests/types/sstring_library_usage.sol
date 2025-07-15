library StringUtils {
    function process(sstring memory data) internal pure returns (sstring memory) {
        return data;
    }
}

contract C {
    using StringUtils for sstring;
    
    function test() public pure {
        sstring memory data = sstring("hello");
        sstring memory result = data.process();
    }
}
// ----
// Warning 2072: (278-299): Unused local variable.