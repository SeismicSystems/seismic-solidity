contract C {
    suint256 private x;
    sint256 private y;

    function test() internal {
        // Double negation
        y = -(-42s);
        // Should be equivalent to positive
        x = -(-42s);
    }
}
// ----
// Warning 10416: (134-137): Shielded number literals will leak during contract deployment.
// Warning 10416: (199-202): Shielded number literals will leak during contract deployment.
