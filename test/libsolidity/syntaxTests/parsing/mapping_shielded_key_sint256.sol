contract c {
	mapping(sint256 => uint) data;
}
// ----
// TypeError 7804: (22-29): Shielded types are not allowed as mapping keys.