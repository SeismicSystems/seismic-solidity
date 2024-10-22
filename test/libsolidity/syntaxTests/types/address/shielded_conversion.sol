contract C {
    function f() public pure returns (saddress) {
        return saddress(2**160 -1);
    }
    function g() public pure returns (saddress) {
        return saddress(type(uint160).max);
    }
}
// ----
