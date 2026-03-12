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
    function i() public pure returns (address view) {}
    function j() public pure returns (address pure) {}
    modifier m1(saddress view) {_;}
    modifier m2(saddress pure) {_;}
    event e1(saddress view);
    event e2(saddress pure);
    error err1(saddress view);
    error err2(saddress pure);
    function f2() public pure returns (address) {
        try address(this.f2()) returns (address view res) {} catch {}
    }
    function f3() public pure returns (address) {
        try address(this.f3()) returns (address pure res) {} catch {}
    }
}
saddress view constant f_a;
saddress pure constant f_b;
saddress view immutable f_c;
saddress pure immutable f_d;
// ----
// TypeError 2311: (17-30): Shielded address types can only be payable or non-payable.
// TypeError 2311: (40-53): Shielded address types can only be payable or non-payable.
// TypeError 2311: (63-76): Shielded address types can only be payable or non-payable.
// TypeError 2311: (104-117): Shielded address types can only be payable or non-payable.
// TypeError 2311: (163-176): Shielded address types can only be payable or non-payable.
// TypeError 2311: (188-201): Shielded address types can only be payable or non-payable.
// TypeError 2311: (240-253): Shielded address types can only be payable or non-payable.
// TypeError 2311: (285-298): Shielded address types can only be payable or non-payable.
// TypeError 2311: (353-365): Address types can only be payable or non-payable.
// TypeError 2311: (408-420): Address types can only be payable or non-payable.
// TypeError 2311: (441-454): Shielded address types can only be payable or non-payable.
// TypeError 2311: (477-490): Shielded address types can only be payable or non-payable.
// TypeError 2311: (510-523): Shielded address types can only be payable or non-payable.
// TypeError 2311: (539-552): Shielded address types can only be payable or non-payable.
// TypeError 2311: (570-583): Shielded address types can only be payable or non-payable.
// TypeError 2311: (601-614): Shielded address types can only be payable or non-payable.
// TypeError 2311: (707-719): Address types can only be payable or non-payable.
// TypeError 2311: (833-845): Address types can only be payable or non-payable.
// TypeError 2311: (871-884): Shielded address types can only be payable or non-payable.
// DeclarationError 10104: (871-897): Shielded objects cannot be set to constant or immutable.
// TypeError 2311: (899-912): Shielded address types can only be payable or non-payable.
// DeclarationError 10104: (899-925): Shielded objects cannot be set to constant or immutable.
// TypeError 2311: (927-940): Shielded address types can only be payable or non-payable.
// DeclarationError 8342: (927-954): Only constant variables are allowed at file level.
// DeclarationError 8297: (927-954): The "immutable" keyword can only be used for state variables.
// DeclarationError 10104: (927-954): Shielded objects cannot be set to constant or immutable.
// TypeError 2311: (956-969): Shielded address types can only be payable or non-payable.
// DeclarationError 8342: (956-983): Only constant variables are allowed at file level.
// DeclarationError 8297: (956-983): The "immutable" keyword can only be used for state variables.
// DeclarationError 10104: (956-983): Shielded objects cannot be set to constant or immutable.
