contract C {
    suint256 private x;

    function test() internal {
        // Various underscore placements in shielded literals
        x = 1_000s;
        x = 1_000_000s;
        x = 1_000_000_000s;
        x = 0xFF_FFs;
        x = 0x00_00_00_01s;
    }
}
// ----
// Warning 9660: (143-149): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (163-173): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (187-201): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (215-223): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (237-251): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
