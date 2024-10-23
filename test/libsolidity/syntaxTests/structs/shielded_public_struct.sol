contract C {
    struct Data {
        suint256 contents;
    }
    // the below shouldn't work if we're being straight across the board
    Data public a;
}
// ----
// TypeError 7091: (141-154): Shielded Types are not supported for public state variables.
