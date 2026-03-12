contract C {
    suint256 private x;

    function test(bool cond) internal {
        // Ternary with shielded literals
        x = cond ? 1s : 2s;
        // Ternary with arithmetic
        x = cond ? (10s + 20s) : 0s;
    }
}
// ----
// Warning 9660: (139-141): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (144-146): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (203-206): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (209-212): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (216-218): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
