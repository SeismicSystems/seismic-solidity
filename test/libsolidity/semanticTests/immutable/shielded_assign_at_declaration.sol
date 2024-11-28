contract A {
	suint8 immutable a = 2;
	function f() public view returns (uint) {
		return uint(a);
	}
}
// ----
// f() -> 2
