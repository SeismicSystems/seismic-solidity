contract C {
    function f() public view returns (saddress) { return address(this); }
    function g() public view returns (uint) { return f().balance; }
    function h() public view returns (bytes memory) { return f().code; }
    function i() public view returns (uint) { return f().code.length; }
    function j() public view returns (uint) { return h().length; }
}
// ----
// DeclarationError 7491: (51-59): Shielded objects cannot be returned, you should cast to an unshielded type.
