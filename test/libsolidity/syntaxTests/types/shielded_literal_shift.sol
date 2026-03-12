contract C {
    suint256 private x;
    suint8 private y;

    function test() internal {
        // Left shift
        x = 1s << 8s;
        // Right shift
        x = 256s >> 4s;
        // Shift small type
        y = 1s << 4s;
        // Large shift
        x = 1s << 255s;
    }
}
// ----
// Warning 9660: (125-127): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (131-133): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (170-174): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (178-180): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (222-224): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (228-230): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (267-269): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (273-277): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
