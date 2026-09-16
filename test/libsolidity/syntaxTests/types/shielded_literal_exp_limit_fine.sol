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
// Warning 10416: (121-123): Shielded number literals will leak during contract deployment.
// Warning 10416: (127-131): Shielded number literals will leak during contract deployment.
// Warning 10416: (145-148): Shielded number literals will leak during contract deployment.
// Warning 10416: (152-155): Shielded number literals will leak during contract deployment.
// Warning 10416: (169-171): Shielded number literals will leak during contract deployment.
// Warning 10416: (175-177): Shielded number literals will leak during contract deployment.
// Warning 10416: (191-193): Shielded number literals will leak during contract deployment.
// Warning 10416: (197-199): Shielded number literals will leak during contract deployment.
