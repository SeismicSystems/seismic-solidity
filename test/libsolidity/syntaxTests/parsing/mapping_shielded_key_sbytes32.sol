contract c {
	mapping(sbytes32 => uint) data;
}
// ----
// TypeError 7804: (22-30): Shielded types are not allowed as mapping keys.