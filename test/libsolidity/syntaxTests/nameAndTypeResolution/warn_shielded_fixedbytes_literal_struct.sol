contract C {
    struct S {
        sbytes4 b;
    }
    constructor() {
        sbytes4 direct = sbytes4(0x01020304);
        S memory s = S({b: sbytes4(0x01020304)});
        s.b = direct;
    }
}
// ----
// Warning 9663: (81-117): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (127-167): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
