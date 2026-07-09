contract C {
    function f(saddress a) public pure returns (address payable) {
        return address(saddress(saddress(a)));
    }
}
// ----
// Warning 10313: (95-125): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
// TypeError 6359: (95-125): Return argument type address is not implicitly convertible to expected type (type of first return variable) address payable.
