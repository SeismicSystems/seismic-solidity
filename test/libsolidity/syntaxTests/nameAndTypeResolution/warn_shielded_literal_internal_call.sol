// Internal function call with shielded literal — SHOULD warn (literal in same contract bytecode)
contract C {
    suint256 private val;

    function _setVal(suint256 _v) internal {
        val = _v;
    }

    function test() external {
        _setVal(suint256(77));
    }
}
// ----
// Warning 9660: (257-269): Literals converted to shielded integers will leak during contract deployment.
