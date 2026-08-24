contract c {
	mapping(sint => uint) data;
}
// ----
// TypeError 10109: (22-26): Shielded types are not allowed as mapping keys.
