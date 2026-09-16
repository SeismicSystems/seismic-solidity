// abi.encodeCall with shielded saddress argument
contract Target {
    function setAddr(saddress x) external {}
}

contract Caller {
    Target t;
    function test() external view {
        abi.encodeCall(t.setAddr, (saddress(address(this))));
    }
}
// ----
// TypeError 10203: (218-243): Shielded types cannot be ABI encoded.
