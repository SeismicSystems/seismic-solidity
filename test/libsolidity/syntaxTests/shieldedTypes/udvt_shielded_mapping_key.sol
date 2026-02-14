contract C {
    type SB is sbool;
    mapping(SB => uint256) m;
}
// ----
// TypeError 7804: (47-49): Shielded types are not allowed as mapping keys.
