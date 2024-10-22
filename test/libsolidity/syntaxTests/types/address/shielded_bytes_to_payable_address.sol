contract C {
    function f(bytes20 x) public pure returns (saddress payable) {
        return payable(saddress(x));
    }
}
// ----
