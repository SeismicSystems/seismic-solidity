contract C {
    suint256 private x;

    function test(bool cond) internal {
        // Ternary with shielded literals
        x = cond ? 1s : 2s;
        // Ternary with arithmetic
        x = cond ? (10s + 20s) : 0s;
    }
}
// ----
// Warning 9667: (139-141): Shielded number literals will leak during contract deployment.
// Warning 9667: (144-146): Shielded number literals will leak during contract deployment.
// Warning 9667: (203-206): Shielded number literals will leak during contract deployment.
// Warning 9667: (209-212): Shielded number literals will leak during contract deployment.
// Warning 9667: (216-218): Shielded number literals will leak during contract deployment.
