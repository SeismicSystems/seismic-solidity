contract c {
	mapping(sbytes32 => uint) data;
}
// ----
// TypeError 10109: (22-30): Shielded types are not allowed as mapping keys.