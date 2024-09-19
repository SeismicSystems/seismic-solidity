contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, Sit }
    constructor() {
        a = 2;
        b = ActionChoices(a);
    }
    suint256 a;
    ActionChoices b;
}
// ----
