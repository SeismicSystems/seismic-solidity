contract C
{
	function f(uint timestamp_seconds) public view {
		assert(block.timestamp_seconds == timestamp_seconds); // should fail
		assert(block.timestamp == timestamp_seconds); // should fail
		assert(block.timestamp == block.timestamp_seconds); // should hold, but fails due to SMT model bug
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// EVMVersion: >=mercury
// ----
// Warning 6328: (63-113): CHC: Assertion violation happens here.
// Warning 6328: (132-174): CHC: Assertion violation happens here.
// Warning 6328: (193-243): CHC: Assertion violation happens here.
