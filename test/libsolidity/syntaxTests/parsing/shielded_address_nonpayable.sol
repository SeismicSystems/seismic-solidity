contract C {
    saddress a;
    function f(saddress b) public pure returns (address c) {
        saddress d = b;
        return address(d);
    }
}
// ----
// Warning 10313: (129-139): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
