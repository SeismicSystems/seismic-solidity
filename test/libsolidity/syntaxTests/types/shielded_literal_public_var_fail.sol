contract C {
    // Shielded types cannot be public (auto-getter)
    suint256 public x = 42s;
}
// ----
// Warning 10416: (90-93): Shielded number literals will leak during contract deployment.
// TypeError 10101: (70-93): Shielded Types are not supported for public state variables.
