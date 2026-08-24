contract C {
    function f(suint160 x) public pure returns (address) {
        return address(x);
    }
}
// ----
// Warning 10313: (87-97): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
