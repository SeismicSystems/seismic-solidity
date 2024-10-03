contract C {
    saddress view m_a;
    saddress pure m_b;
    saddress view[] m_c;
    mapping(uint => saddress view) m_d;
    function f() public pure {
        saddress view a;
        saddress pure b;
        a; b;
    }
    function g(saddress view) public pure {}
    function h(saddress pure) public pure {}
    function i() public pure returns (saddress view) {}
    function j() public pure returns (saddress pure) {}
    modifier m1(saddress view) {_;}
    modifier m2(saddress pure) {_;}
    event e1(saddress view);
    event e2(saddress pure);
    error err1(saddress view);
    error err2(saddress pure);
    function f2() public pure returns (saddress) {
        try this.f2() returns (saddress view res) {} catch {}
    }
    function f3() public pure returns (saddress) {
        try this.f3() returns (saddress pure res) {} catch {}
    }
}
saddress view constant f_a;
saddress pure constant f_b;
// ----
// TypeError 2311: (17-29): Address types can only be payable or non-payable.
// TypeError 2311: (39-51): Address types can only be payable or non-payable.
// TypeError 2311: (61-73): Address types can only be payable or non-payable.
// TypeError 2311: (101-113): Address types can only be payable or non-payable.
// TypeError 2311: (159-171): Address types can only be payable or non-payable.
// TypeError 2311: (183-195): Address types can only be payable or non-payable.
// TypeError 2311: (234-246): Address types can only be payable or non-payable.
// TypeError 2311: (278-290): Address types can only be payable or non-payable.
// TypeError 2311: (345-357): Address types can only be payable or non-payable.
// TypeError 2311: (400-412): Address types can only be payable or non-payable.
// TypeError 2311: (433-445): Address types can only be payable or non-payable.
// TypeError 2311: (468-480): Address types can only be payable or non-payable.
// TypeError 2311: (500-512): Address types can only be payable or non-payable.
// TypeError 2311: (528-540): Address types can only be payable or non-payable.
// TypeError 2311: (558-570): Address types can only be payable or non-payable.
// TypeError 2311: (588-600): Address types can only be payable or non-payable.
// TypeError 2311: (684-696): Address types can only be payable or non-payable.
// TypeError 2311: (801-813): Address types can only be payable or non-payable.
// TypeError 2311: (839-851): Address types can only be payable or non-payable.
// TypeError 2311: (866-878): Address types can only be payable or non-payable.
