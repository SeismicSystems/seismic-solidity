contract C {
    suint256 private x;

    function test() internal {
        // Division by zero with shielded literals
        x = 1s / 0s;
    }
}
// ----
// Warning 9660: (132-134): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (137-139): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 2271: (132-139): Built-in binary operator / cannot be applied to types shielded_int_const 1 and shielded_int_const 0.
