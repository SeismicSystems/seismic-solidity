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
// TypeError 2311: (17-30): Shielded address types can only be payable or non-payable.
// TypeError 2311: (40-53): Shielded address types can only be payable or non-payable.
// TypeError 2311: (63-76): Shielded address types can only be payable or non-payable.
// TypeError 2311: (104-117): Shielded address types can only be payable or non-payable.
// TypeError 2311: (163-176): Shielded address types can only be payable or non-payable.
// TypeError 2311: (188-201): Shielded address types can only be payable or non-payable.
// TypeError 2311: (240-253): Shielded address types can only be payable or non-payable.
// TypeError 2311: (285-298): Shielded address types can only be payable or non-payable.
// TypeError 2311: (353-366): Shielded address types can only be payable or non-payable.
// TypeError 2311: (409-422): Shielded address types can only be payable or non-payable.
// TypeError 2311: (443-456): Shielded address types can only be payable or non-payable.
// TypeError 2311: (479-492): Shielded address types can only be payable or non-payable.
// TypeError 2311: (512-525): Shielded address types can only be payable or non-payable.
// TypeError 2311: (541-554): Shielded address types can only be payable or non-payable.
// TypeError 2311: (572-585): Shielded address types can only be payable or non-payable.
// TypeError 2311: (603-616): Shielded address types can only be payable or non-payable.
// TypeError 2311: (701-714): Shielded address types can only be payable or non-payable.
// TypeError 2311: (820-833): Shielded address types can only be payable or non-payable.
// TypeError 2311: (859-872): Shielded address types can only be payable or non-payable.
// DeclarationError 7491: (859-885): Shielded objects cannot be set to constant.
// TypeError 2311: (887-900): Shielded address types can only be payable or non-payable.
// DeclarationError 7491: (887-913): Shielded objects cannot be set to constant.
