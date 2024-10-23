contract C {
    saddress payable a;
    saddress payable public b;
    saddress payable[] c;
    saddress payable[] public d;
    mapping(uint => saddress payable) e;
    mapping(uint => saddress payable[]) f;
}
// ----
// TypeError 7091: (41-66): Shielded Types are not supported for public state variables.
// TypeError 7091: (98-125): Shielded Types are not supported for public state variables.
