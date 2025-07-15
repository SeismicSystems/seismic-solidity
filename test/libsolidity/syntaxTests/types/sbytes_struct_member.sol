contract C {
    struct Data {
        sbytes value;
        uint256 id;
    }
    
    Data public data;
    
    function test() public {
        Data memory temp;
        temp.value = sbytes("hello");
        temp.id = 42;
    }
}
// ----
// TypeError 7091: (88-104): Shielded Types are not supported for public state variables.