contract C {
    suint256 private x;

    function test() internal {
        // Shielded literal with ether subdenomination should fail
        x = 1s ether;
    }
}
// ----
// ParserError 9832: (151-156): Shielded number literals cannot be used with unit denominations.
