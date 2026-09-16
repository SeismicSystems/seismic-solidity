contract c {
	mapping(sint256 => uint) data;
}
// ----
// TypeError 10109: (22-29): Shielded types are not allowed as mapping keys.
