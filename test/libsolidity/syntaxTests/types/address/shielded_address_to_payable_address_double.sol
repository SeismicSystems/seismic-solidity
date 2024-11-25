contract C {
    function f(saddress a) public pure returns (address payable) {
        return address(saddress(saddress(a)));
    }
}
// ----
// TypeError 6359: (95-125): Return argument type address is not implicitly convertible to expected type (type of first return variable) address payable.
