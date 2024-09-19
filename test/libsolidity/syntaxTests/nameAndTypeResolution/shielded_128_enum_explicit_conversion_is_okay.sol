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
