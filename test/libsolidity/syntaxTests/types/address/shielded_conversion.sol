contract C {
    function f() public pure returns (address) {
        return address(saddress(2**160 -1));
    }
    function g() public pure returns (address) {
        return address(saddress(type(uint160).max));
    }
}
// ----
// Warning 10313: (77-105): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
// Warning 10313: (177-213): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
