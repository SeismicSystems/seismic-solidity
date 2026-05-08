contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, Sit }
    constructor() {
        a = suint(2);
        b = ActionChoices(a);
    }
    suint256 a;
    ActionChoices b;
}
// ----
// Warning 10403: (108-116): Literals converted to shielded integers will leak during contract deployment.
// TypeError 9640: (130-146): Explicit type conversion not allowed from "suint256" to "enum test.ActionChoices".
