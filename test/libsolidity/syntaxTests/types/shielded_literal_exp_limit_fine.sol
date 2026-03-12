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
// Warning 9667: (121-123): Shielded number literals will leak during contract deployment.
// Warning 9667: (127-131): Shielded number literals will leak during contract deployment.
// Warning 9667: (145-148): Shielded number literals will leak during contract deployment.
// Warning 9667: (152-155): Shielded number literals will leak during contract deployment.
// Warning 9667: (169-171): Shielded number literals will leak during contract deployment.
// Warning 9667: (175-177): Shielded number literals will leak during contract deployment.
// Warning 9667: (191-193): Shielded number literals will leak during contract deployment.
// Warning 9667: (197-199): Shielded number literals will leak during contract deployment.
