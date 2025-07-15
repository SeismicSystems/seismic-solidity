contract C {
    sstring data;
    
    function test() public view {
        sstring memory y;
        sstring storage x = data;
    }
}
// ----
// Warning 2072: (78-94): Unused local variable.
// Warning 2072: (104-121): Unused local variable.