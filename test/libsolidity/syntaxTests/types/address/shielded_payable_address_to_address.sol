contract C {
    function f(saddress payable a) public pure {
        saddress payable b;
        saddress c = a;
        c = b;
    }
}
// ----
