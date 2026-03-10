// Library internal function with shielded literal — SHOULD warn (same bytecode)
library Lib {
    function helper(suint256 x) internal pure returns(suint256) { return x; }
}

contract C {
    suint256 private val;
    function test() external {
        val = Lib.helper(suint256(5));
    }
}
// ----
// Warning 9660: (273-284): Literals converted to shielded integers will leak during contract deployment.
