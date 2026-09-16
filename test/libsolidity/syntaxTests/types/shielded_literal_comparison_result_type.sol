// Test: comparison of shielded literals should produce sbool, not bool
contract C {
    sbool private r;

    function test() internal {
        // Comparison of shielded literals should produce sbool
        r = (1s < 2s);
        r = (1s == 1s);
        r = (1s != 2s);
        // Assigning comparison result to bool should fail
        bool b = (1s < 2s);
    }
}
// ----
// Warning 10416: (215-217): Shielded number literals will leak during contract deployment.
// Warning 10416: (220-222): Shielded number literals will leak during contract deployment.
// Warning 10416: (238-240): Shielded number literals will leak during contract deployment.
// Warning 10416: (244-246): Shielded number literals will leak during contract deployment.
// Warning 10416: (262-264): Shielded number literals will leak during contract deployment.
// Warning 10416: (268-270): Shielded number literals will leak during contract deployment.
// Warning 10416: (350-352): Shielded number literals will leak during contract deployment.
// Warning 10416: (355-357): Shielded number literals will leak during contract deployment.
// TypeError 9574: (340-358): Type sbool is not implicitly convertible to expected type bool.
