contract A {
    suint a = 5;
    constructor() { a %= suint(((2)*2)%4); }
}
// ----
