contract C {
    type SU is suint256;
    mapping(SU => uint256) m;
}
// ----
// TypeError 7804: (50-52): Shielded types are not allowed as mapping keys.
