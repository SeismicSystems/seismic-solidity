contract C {
    function f(bytes10 x) public pure returns (saddress payable) {
        return saddress(x);
    }
}
// ----
// TypeError 9640: (95-106): Explicit type conversion not allowed from "bytes10" to "saddress".
// TypeError 6359: (94-106): Return argument type saddress is not implicitly convertible to expected type (type of first return variable) saddress payable.
