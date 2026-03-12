contract C {
    suint8 private a;
    suint256 private b;

    function test() internal {
        // Same shielded literal fitting different types
        a = 100s;
        b = 100s;
        // Arithmetic result fitting different types
        a = 2s * 50s;
        b = 2s * 50s;
    }
}
// ----
// Warning 9667: (160-164): Shielded number literals will leak during contract deployment.
// Warning 9667: (178-182): Shielded number literals will leak during contract deployment.
// Warning 9667: (249-251): Shielded number literals will leak during contract deployment.
// Warning 9667: (254-257): Shielded number literals will leak during contract deployment.
// Warning 9667: (271-273): Shielded number literals will leak during contract deployment.
// Warning 9667: (276-279): Shielded number literals will leak during contract deployment.
