library StringUtils {
    function process(sbytes memory data) internal pure returns (sbytes memory) {
        return data;
    }
}

contract C {
    using StringUtils for sbytes;
    
    function test() public pure {
        sbytes memory data = sbytes("hello");
        sbytes memory result = data.process();
    }
}
// ----
// Warning 2072: (273-293): Unused local variable.