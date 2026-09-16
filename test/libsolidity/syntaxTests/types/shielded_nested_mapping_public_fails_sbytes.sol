contract Test {
    mapping(uint256 => sbytes4[3][]) public a;
    mapping(uint256 => sbytes32[3][]) public b;
}
// ----
// TypeError 10101: (20-61): Shielded Types are not supported for public state variables.
// TypeError 10101: (67-109): Shielded Types are not supported for public state variables.
