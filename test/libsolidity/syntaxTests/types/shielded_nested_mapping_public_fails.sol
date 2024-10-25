contract Test {
    mapping(uint256 => suint256[3][]) public a;
}
// ----
// TypeError 7091: (20-62): Shielded Types are not supported for public state variables.
