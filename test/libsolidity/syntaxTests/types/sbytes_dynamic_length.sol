contract C {
    sbytes data;

    function testLength() internal view returns (suint256) {
        // length of sbytes should be suint256 (shielded)
        return data.length;
    }

    function testLengthNotUint() internal view {
        // Should NOT be assignable to uint256 (it's suint256)
        suint256 len = data.length;
    }
}
// ----
// Warning 2072: (305-317): Unused local variable.
