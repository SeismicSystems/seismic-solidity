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
// Warning 9667: (134-137): Shielded number literals will leak during contract deployment.
// Warning 9667: (199-202): Shielded number literals will leak during contract deployment.
