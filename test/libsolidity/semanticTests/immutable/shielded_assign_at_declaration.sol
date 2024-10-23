contract A {
	suint8 immutable a = 2;
	function f() public view returns (suint) {
		return a;
	}
}
// ----
// f() -> 2
