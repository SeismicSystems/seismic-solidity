contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, Sit }
    function f(saddress a) public pure returns (ActionChoices) {
        return ActionChoices(a);
    }
}
// ----
// TypeError 9640: (156-172): Explicit type conversion not allowed from "saddress" to "enum test.ActionChoices".
