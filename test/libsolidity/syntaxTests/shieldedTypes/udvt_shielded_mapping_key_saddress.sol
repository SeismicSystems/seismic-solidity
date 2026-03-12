contract C {
    type SA is saddress;
    mapping(SA => uint256) m;
}
// ----
// TypeError 10109: (50-52): Shielded types are not allowed as mapping keys.
