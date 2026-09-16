contract C {
    function f(saddress payable) internal pure {}
    function f(saddress) internal pure returns (uint) {}
    function g() internal pure {
        saddress a = saddress(0);
        uint b = f(a); // TODO: should this be valid?
        b;
    }
}
// ----
