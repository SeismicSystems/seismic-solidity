contract C {
    // Shielded types cannot be used as mapping keys
    mapping(suint256 => uint256) private m;
}
// ----
// TypeError 7804: (78-86): Shielded types are not allowed as mapping keys.
