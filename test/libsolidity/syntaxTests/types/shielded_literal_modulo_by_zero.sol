contract C {
    suint256 private x;

    function test() internal {
        // Modulo by zero with shielded literals
        x = 1s % 0s;
    }
}
// ----
// Warning 10416: (130-132): Shielded number literals will leak during contract deployment.
// Warning 10416: (135-137): Shielded number literals will leak during contract deployment.
// TypeError 2271: (130-137): Built-in binary operator % cannot be applied to types shielded_int_const 1 and shielded_int_const 0.
