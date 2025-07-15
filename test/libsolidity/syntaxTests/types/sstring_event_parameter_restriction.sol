contract C {
    event TestEvent(sstring data);
    event TestEventIndexed(sstring indexed data);
    
    function test() public {
        emit TestEvent(sstring("hello"));
    }
}
// ----
// TypeError 4626: (33-45): Shielded Types are not allowed as event parameter type.