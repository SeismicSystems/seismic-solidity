contract C {
    event TestEvent(sbytes data);
    event TestEventIndexed(sbytes indexed data);
    
    function test() public {
        emit TestEvent(sbytes("hello"));
    }
}
// ----
// TypeError 4626: (33-44): Shielded Types are not allowed as event parameter type.