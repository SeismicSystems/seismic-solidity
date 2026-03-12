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
// Warning 9660: (127-129): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (143-145): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (159-161): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (175-177): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (191-194): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (208-211): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (225-228): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (242-246): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (260-264): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (278-283): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (297-305): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
