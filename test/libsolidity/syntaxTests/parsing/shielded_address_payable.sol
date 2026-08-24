contract C {
    saddress payable a;
    function f(saddress payable b) public pure returns (address payable c) {
        saddress payable d = b;
        return payable(address(d));
    }
}
// ----
// Warning 10313: (169-179): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
