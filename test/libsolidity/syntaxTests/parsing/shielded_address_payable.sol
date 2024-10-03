contract C {
    saddress payable a;
    function f(saddress payable b) public pure returns (saddress payable c) {
        saddress payable d = b;
        return d;
    }
}
// ----
