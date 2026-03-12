contract C {
    suint256 private x;

    function test() internal {
        // Various scientific notation shielded literals
        x = 1e0s;
        x = 1e1s;
        x = 1e18s;
        x = 1e77s;
        x = 5e10s;
        x = 2e5s;
    }
}
// ----
// Warning 9667: (138-142): Shielded number literals will leak during contract deployment.
// Warning 9667: (156-160): Shielded number literals will leak during contract deployment.
// Warning 9667: (174-179): Shielded number literals will leak during contract deployment.
// Warning 9667: (193-198): Shielded number literals will leak during contract deployment.
// Warning 9667: (212-217): Shielded number literals will leak during contract deployment.
// Warning 9667: (231-235): Shielded number literals will leak during contract deployment.
