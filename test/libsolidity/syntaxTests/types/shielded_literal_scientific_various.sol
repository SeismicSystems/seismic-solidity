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
// Warning 10416: (138-142): Shielded number literals will leak during contract deployment.
// Warning 10416: (156-160): Shielded number literals will leak during contract deployment.
// Warning 10416: (174-179): Shielded number literals will leak during contract deployment.
// Warning 10416: (193-198): Shielded number literals will leak during contract deployment.
// Warning 10416: (212-217): Shielded number literals will leak during contract deployment.
// Warning 10416: (231-235): Shielded number literals will leak during contract deployment.
