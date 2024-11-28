contract C {
    function f(bytes32 x) public pure returns (address payable) {
        return address(saddress(x));
    }
}
// ----
// TypeError 9640: (102-113): Explicit type conversion not allowed from "bytes32" to "saddress".
// TypeError 6359: (94-114): Return argument type address is not implicitly convertible to expected type (type of first return variable) address payable.
