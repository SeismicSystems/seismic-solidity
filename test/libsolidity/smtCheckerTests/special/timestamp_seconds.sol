contract C
{
	function f(uint timestamp_seconds) public view {
		assert(block.timestamp_seconds == timestamp_seconds); // should fail
		assert(block.timestamp == timestamp_seconds); // should fail
		assert(block.timestamp == block.timestamp_seconds); // should hold
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// EVMVersion: >=mercury
// ----
// Warning 6328: (65-117): CHC: Assertion violation happens here.
// Warning 6328: (136-180): CHC: Assertion violation happens here.
// Info 1391: CHC: 1 verification condition(s) proved safe! Enable the model checker option "show proved safe" to see all of them.
