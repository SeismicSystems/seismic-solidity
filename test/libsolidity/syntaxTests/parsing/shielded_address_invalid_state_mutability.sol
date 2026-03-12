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
// TypeError 10108: (17-30): Shielded address types can only be payable or non-payable.
// TypeError 10108: (40-53): Shielded address types can only be payable or non-payable.
// TypeError 10108: (63-76): Shielded address types can only be payable or non-payable.
// TypeError 10108: (104-117): Shielded address types can only be payable or non-payable.
// TypeError 10108: (163-176): Shielded address types can only be payable or non-payable.
// TypeError 10108: (188-201): Shielded address types can only be payable or non-payable.
// TypeError 10108: (240-253): Shielded address types can only be payable or non-payable.
// TypeError 10108: (285-298): Shielded address types can only be payable or non-payable.
// TypeError 10108: (353-365): Address types can only be payable or non-payable.
// TypeError 10108: (408-420): Address types can only be payable or non-payable.
// TypeError 10108: (441-454): Shielded address types can only be payable or non-payable.
// TypeError 10108: (477-490): Shielded address types can only be payable or non-payable.
// TypeError 10108: (510-523): Shielded address types can only be payable or non-payable.
// TypeError 10108: (539-552): Shielded address types can only be payable or non-payable.
// TypeError 10108: (570-583): Shielded address types can only be payable or non-payable.
// TypeError 10108: (601-614): Shielded address types can only be payable or non-payable.
// TypeError 10108: (707-719): Address types can only be payable or non-payable.
// TypeError 10108: (833-845): Address types can only be payable or non-payable.
// TypeError 10108: (871-884): Shielded address types can only be payable or non-payable.
// DeclarationError 10104: (871-897): Shielded objects cannot be set to constant or immutable.
// TypeError 10108: (899-912): Shielded address types can only be payable or non-payable.
// DeclarationError 10104: (899-925): Shielded objects cannot be set to constant or immutable.
// TypeError 10108: (927-940): Shielded address types can only be payable or non-payable.
// DeclarationError 8342: (927-954): Only constant variables are allowed at file level.
// DeclarationError 8297: (927-954): The "immutable" keyword can only be used for state variables.
// DeclarationError 10104: (927-954): Shielded objects cannot be set to constant or immutable.
// TypeError 10108: (956-969): Shielded address types can only be payable or non-payable.
// DeclarationError 8342: (956-983): Only constant variables are allowed at file level.
// DeclarationError 8297: (956-983): The "immutable" keyword can only be used for state variables.
// DeclarationError 10104: (956-983): Shielded objects cannot be set to constant or immutable.
