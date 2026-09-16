contract C {
    function f(bytes memory b) public pure returns (address payable) {
        (saddress payable c) = abi.decode(b, (saddress));
        return payable(address(c));
    }
}
// ----
// TypeError 10201: (130-138): Shielded types cannot be ABI encoded.
// Warning 10313: (165-175): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
