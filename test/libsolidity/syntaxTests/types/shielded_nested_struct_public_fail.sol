contract Test {
    struct MyStructSuint {
        suint256[3][] b;
    }
    MyStructSuint public failSuint;
    struct MyStructSaddress {
        saddress[3][] b;
    }
    MyStructSaddress public failSaddress;
    struct MyStructSbool {
        suint256[3][] b;
    }
    MyStructSbool public failSbool;
}
// ----
// TypeError 10101: (78-108): Shielded Types are not supported for public state variables.
// TypeError 5359: (78-108): The struct has all its members omitted, therefore the getter cannot return any values.
// TypeError 10101: (175-211): Shielded Types are not supported for public state variables.
// TypeError 5359: (175-211): The struct has all its members omitted, therefore the getter cannot return any values.
// TypeError 10101: (275-305): Shielded Types are not supported for public state variables.
// TypeError 5359: (275-305): The struct has all its members omitted, therefore the getter cannot return any values.
