contract C {
    function f() public view returns (saddress) { return address(this); }
    function g() public view returns (uint) { return f().balance; }
    function h() public view returns (bytes memory) { return f().code; }
    function i() public view returns (uint) { return f().code.length; }
    function j() public view returns (uint) { return h().length; }
}
// ----
// DeclarationError 7492: (51-59): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
