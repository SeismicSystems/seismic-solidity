contract C {
    saddress payable a;
    function f(saddress payable b) public pure returns (address payable c) {
        saddress payable d = b;
        return payable(address(d));
    }
}
// ----
