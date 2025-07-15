contract C {
    mapping(uint256 => sstring) public data;
    mapping(address => sstring) private userData;
    
    function test() public {
        data[1] = sstring("hello");
        userData[msg.sender] = sstring("world");
    }
}
// ----
// TypeError 7091: (17-56): Shielded Types are not supported for public state variables.