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
// Warning 9660: (215-217): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (220-222): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (238-240): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (244-246): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (262-264): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (268-270): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (350-352): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (355-357): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 9574: (340-358): Type sbool is not implicitly convertible to expected type bool.
