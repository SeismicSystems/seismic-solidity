contract C {
    function f(uint x) public pure returns (address payable) {
        return payable(address(payable(saddress(uint160(x)))));
    }
}
// ----
// Warning 10313: (99-137): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
