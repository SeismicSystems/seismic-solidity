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
// Warning 9665: (72-92): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 7091: (98-125): Shielded Types are not supported for public state variables.
// Warning 9665: (98-125): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
