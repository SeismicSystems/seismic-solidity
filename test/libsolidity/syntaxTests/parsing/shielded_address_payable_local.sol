contract C {
    mapping(uint => saddress payable) m;
    mapping(uint => saddress payable[]) n;
    function f() public view {
        saddress payable a;
        saddress payable[] memory b;
        mapping(uint => saddress payable) storage c = m;
        mapping(uint => saddress payable[]) storage d = n;
        a; b; c; d;
    }
}
// ----
