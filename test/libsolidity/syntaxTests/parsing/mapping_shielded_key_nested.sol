contract c {
	mapping(uint => mapping(saddress => uint)) data;
}
// ----
// TypeError 10109: (38-46): Shielded types are not allowed as mapping keys.