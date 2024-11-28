contract C {
    function f(bytes memory b) public pure returns (address payable) {
        (saddress payable c) = abi.decode(b, (saddress));
        return payable(address(c));
    }
}
// ----
