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
// Warning 9660: (215-218): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (246-249): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (332-336): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (339-342): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 2072: (307-324): Unused local variable.
