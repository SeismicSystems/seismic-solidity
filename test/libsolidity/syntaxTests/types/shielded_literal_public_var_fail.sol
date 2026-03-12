contract C {
    // Shielded types cannot be public (auto-getter)
    suint256 public x = 42s;
}
// ----
// Warning 9660: (90-93): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7091: (70-93): Shielded Types are not supported for public state variables.
