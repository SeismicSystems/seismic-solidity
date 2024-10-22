contract C {
    saddress a;
    function f(saddress b) public pure returns (saddress c) {
        saddress d = b;
        return d;
    }
}
// ----
