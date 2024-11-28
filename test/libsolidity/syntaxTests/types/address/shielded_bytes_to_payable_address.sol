contract C {
    function f(bytes20 x) public pure returns (address payable) {
        saddress payable a = payable(saddress(x));
        return payable(address(a));
    }
}
// ----
