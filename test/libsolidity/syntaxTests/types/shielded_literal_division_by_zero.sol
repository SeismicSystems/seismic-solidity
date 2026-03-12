contract C {
    suint256 private x;

    function test() internal {
        // Division by zero with shielded literals
        x = 1s / 0s;
    }
}
// ----
// Warning 9667: (132-134): Shielded number literals will leak during contract deployment.
// Warning 9667: (137-139): Shielded number literals will leak during contract deployment.
// TypeError 2271: (132-139): Built-in binary operator / cannot be applied to types shielded_int_const 1 and shielded_int_const 0.
