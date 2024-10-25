contract Test {
    struct MyStruct {
        suint256[3][] b;
    }
    MyStruct public fail;
}
// ----
// TypeError 7091: (73-93): Shielded Types are not supported for public state variables.
// TypeError 5359: (73-93): The struct has all its members omitted, therefore the getter cannot return any values.
