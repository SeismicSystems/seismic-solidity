// Public state variable of struct with shielded field should error
contract C {
    struct S {
        uint256 a;
        suint256 b;
    }
    S public s;
}
// ----
// TypeError 10101: (145-155): Shielded Types are not supported for public state variables.
