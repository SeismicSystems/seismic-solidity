contract C {
    function f(uint x) public pure returns (address payable) {
        return payable(address(payable(saddress(uint160(x)))));
    }
}
// ----
