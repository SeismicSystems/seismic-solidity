contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, Sit }
    constructor() {
        a = suint256(ActionChoices.GoStraight);
        b = suint64(ActionChoices.Sit);
    }
    suint256 a;
    suint64 b;
}
// ----
// Warning 10415: (108-142): Enums converted to shielded integers will leak during contract deployment.
// Warning 10415: (156-182): Enums converted to shielded integers will leak during contract deployment.
