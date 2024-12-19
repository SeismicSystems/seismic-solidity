contract A {
    suint a = suint(5);
    constructor() { a %= suint(((2)*2)%4); }
}
// ----
