contract C {
    function f(saddress payable) internal pure {}
    function f(saddress) internal pure {}
    function g() internal pure {
        saddress payable a = payable(0);
        f(a);
    }
}
// ----
// TypeError 4487: (184-185): No unique declaration found after argument-dependent lookup.
