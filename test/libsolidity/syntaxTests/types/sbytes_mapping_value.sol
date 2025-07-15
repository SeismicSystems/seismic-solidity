contract C {
    mapping(uint256 => sbytes) public data;
    mapping(address => sbytes) private userData;
    
    function test() public {
        data[1] = sbytes("hello");
        userData[msg.sender] = sbytes("world");
    }
}
// ----
// TypeError 7091: (17-55): Shielded Types are not supported for public state variables.