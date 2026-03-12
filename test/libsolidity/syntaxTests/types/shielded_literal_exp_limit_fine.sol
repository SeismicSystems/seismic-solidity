contract C {
    suint256 private x;

    function test() internal {
        // Exponentiation within bounds
        x = 2s ** 255s;
        x = 10s ** 77s;
        x = 2s ** 0s;
        x = 0s ** 0s;
    }
}
// ----
// Warning 9660: (121-123): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (127-131): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (145-148): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (152-155): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (169-171): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (175-177): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (191-193): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (197-199): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
