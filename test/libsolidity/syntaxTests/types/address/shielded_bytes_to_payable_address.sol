contract C {
    function f(bytes20 x) public pure returns (address payable) {
        saddress payable a = payable(saddress(x));
        return payable(address(a));
    }
}
// ----
// Warning 10313: (153-163): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
