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
// Warning 9660: (138-142): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (156-160): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (174-179): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (193-198): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (212-217): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (231-235): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
