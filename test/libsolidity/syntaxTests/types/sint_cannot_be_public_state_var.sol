// Adapted from: syntaxTests/types/suint_cannot_be_public_state_var.sol
contract C {
    sint256 public x;
}
// ----
// TypeError 10101: (89-105): Shielded Types are not supported for public state variables.
