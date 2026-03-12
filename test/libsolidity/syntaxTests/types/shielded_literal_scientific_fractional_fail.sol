// Test: scientific notation that produces fractional result should fail
contract C {
    suint256 private x;

    function test() internal {
        // 1e-1 = 0.1 -- fractional, should fail
        x = 1e-1s;
    }
}
// ----
// Warning 10416: (203-208): Shielded number literals will leak during contract deployment.
// TypeError 2326: (203-208): Type shielded_rational_const 1 / 10 is not implicitly convertible to expected type suint256. Try converting to type ufixed8x1 or use an explicit conversion.
