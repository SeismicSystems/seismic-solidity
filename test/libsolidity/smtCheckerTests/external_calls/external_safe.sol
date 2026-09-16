abstract contract D {
	function d() external virtual;
}

contract C {
	uint x;
	D d;
	function f() public {
		if (x < 4)
			++x;
	}
	function g() public {
		d.d();
		assert(x < 5);
	}
}
// ====
// SMTEngine: all
// SMTTargets: assert
// ----
// Warning 6328: (166-179): CHC: Assertion violation might happen here.
// Warning 4661: (166-179): BMC: Assertion violation happens here.
