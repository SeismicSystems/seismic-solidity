contract C {
    struct Data {
        suint256 value;
        sint256 signed_value;
    }

    Data private d;

    function test() internal {
        // Assign shielded literals to struct fields
        d.value = 42s;
        d.signed_value = -10s;
        // Create struct with shielded literals
        Data memory local = Data(100s, -50s);
    }
}
// ----
// Warning 9667: (215-218): Shielded number literals will leak during contract deployment.
// Warning 9667: (246-249): Shielded number literals will leak during contract deployment.
// Warning 9667: (332-336): Shielded number literals will leak during contract deployment.
// Warning 9667: (339-342): Shielded number literals will leak during contract deployment.
// Warning 2072: (307-324): Unused local variable.
