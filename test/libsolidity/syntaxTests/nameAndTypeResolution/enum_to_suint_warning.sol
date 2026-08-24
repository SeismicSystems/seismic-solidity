contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, Sit }
    constructor() {
        a = ActionChoices.GoStraight;
        b = ActionChoices.Sit;
    }
    suint256 a;
    suint64 b;
}
// ----
// TypeError 7407: (108-132): Type enum test.ActionChoices is not implicitly convertible to expected type suint256.
// TypeError 7407: (146-163): Type enum test.ActionChoices is not implicitly convertible to expected type suint64.
