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
// Warning 10416: (143-149): Shielded number literals will leak during contract deployment.
// Warning 10416: (163-173): Shielded number literals will leak during contract deployment.
// Warning 10416: (187-201): Shielded number literals will leak during contract deployment.
// Warning 10416: (215-223): Shielded number literals will leak during contract deployment.
// Warning 10416: (237-251): Shielded number literals will leak during contract deployment.
