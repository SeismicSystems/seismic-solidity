contract C {
    mapping(saddress => saddress payable) public m;
    function f(saddress payable arg) public returns (saddress payable r) {
        saddress payable a = m[arg];
        r = arg;
        saddress c = saddress(this);
        m[c] = payable(saddress(0));
    }
}

// ----
