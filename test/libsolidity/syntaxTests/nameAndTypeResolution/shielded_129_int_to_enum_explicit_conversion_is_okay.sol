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
// Warning 9660: (108-116): Literals converted to shielded integers will leak during contract deployment.
