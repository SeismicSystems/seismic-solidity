contract C {
    suint256 private wide;
    sint256 private swide;

    function test() internal {
        // Small shielded literals should implicitly fit into wider types
        wide = 1s;
        wide = 255s;
        wide = 65535s;
        swide = 1s;
        swide = -1s;
        swide = 127s;
        swide = -128s;
    }
}
// ----
// Warning 10416: (188-190): Shielded number literals will leak during contract deployment.
// Warning 10416: (207-211): Shielded number literals will leak during contract deployment.
// Warning 10416: (228-234): Shielded number literals will leak during contract deployment.
// Warning 10416: (252-254): Shielded number literals will leak during contract deployment.
// Warning 10416: (273-275): Shielded number literals will leak during contract deployment.
// Warning 10416: (293-297): Shielded number literals will leak during contract deployment.
// Warning 10416: (316-320): Shielded number literals will leak during contract deployment.
