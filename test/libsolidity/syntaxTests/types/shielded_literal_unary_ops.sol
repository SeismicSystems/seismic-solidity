contract C {
    sint256 private x;

    function test() internal {
        // Unary minus
        x = -42s;
        // Double negation
        x = -(-42s);
        // Triple negation
        x = -(-(-42s));
    }
}
// ----
// Warning 9667: (104-107): Shielded number literals will leak during contract deployment.
// Warning 9667: (151-154): Shielded number literals will leak during contract deployment.
// Warning 9667: (201-204): Shielded number literals will leak during contract deployment.
