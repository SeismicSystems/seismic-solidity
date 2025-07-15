contract C {
    sbytes data;
    function test() public view {
        sbytes memory x;
        sbytes storage y = data;
    }
}
// ----
// Warning 2072: (72-87): Unused local variable.
// Warning 2072: (97-113): Unused local variable.