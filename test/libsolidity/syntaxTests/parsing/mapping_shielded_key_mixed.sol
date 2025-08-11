contract c {
	mapping(saddress => mapping(uint => sbool)) data;
}
// ----
// TypeError 7804: (22-30): Shielded types are not allowed as mapping keys.