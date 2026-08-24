contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, Sit }
    function f(saddress a) public pure returns (ActionChoices) {
        return ActionChoices(a);
    }
}
// ----
// TypeError 9640: (156-172): Explicit type conversion not allowed from "saddress" to "enum test.ActionChoices".
// Warning 10313: (156-172): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
