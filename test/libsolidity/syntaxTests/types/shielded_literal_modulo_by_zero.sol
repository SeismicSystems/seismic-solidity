contract C {
    suint256 private x;

    function test() internal {
        // Modulo by zero with shielded literals
        x = 1s % 0s;
    }
}
// ----
// Warning 9660: (130-132): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (135-137): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 2271: (130-137): Built-in binary operator % cannot be applied to types shielded_int_const 1 and shielded_int_const 0.
