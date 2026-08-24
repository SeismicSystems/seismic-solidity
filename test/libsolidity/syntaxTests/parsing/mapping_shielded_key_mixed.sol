contract c {
	mapping(saddress => mapping(uint => sbool)) data;
}
// ----
// TypeError 10109: (22-30): Shielded types are not allowed as mapping keys.