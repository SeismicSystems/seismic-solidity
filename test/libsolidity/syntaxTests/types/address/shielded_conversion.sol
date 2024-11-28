contract C {
    function f() public pure returns (address) {
        return address(saddress(2**160 -1));
    }
    function g() public pure returns (address) {
        return address(saddress(type(uint160).max));
    }
}
// ----
