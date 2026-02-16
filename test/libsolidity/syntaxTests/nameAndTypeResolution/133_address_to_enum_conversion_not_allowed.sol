contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, Sit }
    function f(address a) public pure returns (ActionChoices) {
        return ActionChoices(a);
    }
}
// ----
// TypeError 9640: (155-171): Explicit type conversion not allowed from "address" to "enum test.ActionChoices".
