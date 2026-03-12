contract C {
    type SB is sbytes32;
    mapping(SB => uint256) m;
}
// ----
// TypeError 7804: (50-52): Shielded types are not allowed as mapping keys.
