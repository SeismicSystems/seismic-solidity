contract C {
    suint256 private x;

    function test() internal {
        // Powers of two as shielded literals
        x = 1s;
        x = 2s;
        x = 4s;
        x = 8s;
        x = 16s;
        x = 32s;
        x = 64s;
        x = 128s;
        x = 256s;
        x = 1024s;
        x = 1048576s;
    }
}
// ----
// Warning 10416: (127-129): Shielded number literals will leak during contract deployment.
// Warning 10416: (143-145): Shielded number literals will leak during contract deployment.
// Warning 10416: (159-161): Shielded number literals will leak during contract deployment.
// Warning 10416: (175-177): Shielded number literals will leak during contract deployment.
// Warning 10416: (191-194): Shielded number literals will leak during contract deployment.
// Warning 10416: (208-211): Shielded number literals will leak during contract deployment.
// Warning 10416: (225-228): Shielded number literals will leak during contract deployment.
// Warning 10416: (242-246): Shielded number literals will leak during contract deployment.
// Warning 10416: (260-264): Shielded number literals will leak during contract deployment.
// Warning 10416: (278-283): Shielded number literals will leak during contract deployment.
// Warning 10416: (297-305): Shielded number literals will leak during contract deployment.
