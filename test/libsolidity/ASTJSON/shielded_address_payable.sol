contract C {
    mapping(saddress => saddress payable) m;
    function f(saddress payable arg) public returns (address payable r) {
        saddress payable a = m[arg];
        r = payable(address(arg));
        saddress c = saddress(this);
        m[c] = payable(saddress(0));
    }
}

// ----
