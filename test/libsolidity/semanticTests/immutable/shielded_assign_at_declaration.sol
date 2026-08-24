contract A {
	suint8 a = suint8(2);
	function f() public view returns (uint) {
		return uint(a);
	}
}
// ----
// f() -> 2
