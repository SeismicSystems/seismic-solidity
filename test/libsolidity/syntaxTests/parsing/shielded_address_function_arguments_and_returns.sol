contract C {
    function f(saddress) public pure returns (address) {}
    function g(saddress payable) public pure returns (address payable) {}
}
// ----
// DeclarationError 7491: (59-67): Shielded objects cannot be returned, you should cast to an unshielded type.
// DeclarationError 7491: (126-142): Shielded objects cannot be returned, you should cast to an unshielded type.
