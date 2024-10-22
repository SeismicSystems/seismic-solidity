contract C {
    function f(bytes memory b) public pure returns (saddress payable) {
        (saddress payable c) = abi.decode(b, (saddress));
        return c;
    }
}
// ----
