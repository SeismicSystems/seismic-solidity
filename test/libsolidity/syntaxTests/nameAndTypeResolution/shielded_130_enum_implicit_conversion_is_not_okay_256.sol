contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, Sit }
    constructor() {
        a = ActionChoices.GoStraight;
    }
    suint256 a;
}
// ----
// TypeError 7407: (108-132): Type enum test.ActionChoices is not implicitly convertible to expected type suint256.
