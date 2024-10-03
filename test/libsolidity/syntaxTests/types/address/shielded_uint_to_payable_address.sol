contract C {
    function f(uint x) public pure returns (saddress payable) {
        return payable(saddress(uint160(x)));
    }
}
// ----
