contract Test {
    mapping(uint256 => suint256[3][]) public a;
    mapping(uint256 => sbool[3][]) public b;
    mapping(uint256 => saddress[3][]) public c;
}
// ----
// TypeError 7091: (20-62): Shielded Types are not supported for public state variables.
// TypeError 7091: (68-107): Shielded Types are not supported for public state variables.
// TypeError 7091: (113-155): Shielded Types are not supported for public state variables.
