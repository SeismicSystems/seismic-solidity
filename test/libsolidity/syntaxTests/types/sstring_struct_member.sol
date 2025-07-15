contract C {
    struct Data {
        sstring value;
        uint256 id;
    }
    
    Data public data;
    
    function test() public {
        Data memory temp;
        temp.value = sstring("hello");
        temp.id = 42;
    }
}
// ----
// TypeError 7091: (89-105): Shielded Types are not supported for public state variables.