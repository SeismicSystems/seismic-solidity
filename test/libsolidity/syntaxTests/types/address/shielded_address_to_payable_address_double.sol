contract C {
    function f(saddress a) public pure returns (saddress payable) {
        return saddress(saddress(a));
    }
}
// ----
// TypeError 6359: (96-117): Return argument type saddress is not implicitly convertible to expected type (type of first return variable) saddress payable.
