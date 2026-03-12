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
// Warning 9667: (188-190): Shielded number literals will leak during contract deployment.
// Warning 9667: (207-211): Shielded number literals will leak during contract deployment.
// Warning 9667: (228-234): Shielded number literals will leak during contract deployment.
// Warning 9667: (252-254): Shielded number literals will leak during contract deployment.
// Warning 9667: (273-275): Shielded number literals will leak during contract deployment.
// Warning 9667: (293-297): Shielded number literals will leak during contract deployment.
// Warning 9667: (316-320): Shielded number literals will leak during contract deployment.
