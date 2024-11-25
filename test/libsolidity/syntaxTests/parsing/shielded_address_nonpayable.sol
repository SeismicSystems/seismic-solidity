contract C {
    saddress a;
    function f(saddress b) public pure returns (address c) {
        saddress d = b;
        return address(d);
    }
}
// ----
