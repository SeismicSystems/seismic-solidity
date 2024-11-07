contract A {
	uint immutable a;
	constructor() {
		a = 7;
	}
	function f() public view returns (uint) { return a; }
}
// ====
// compileToEOF: true
// ----
// f() -> 7
