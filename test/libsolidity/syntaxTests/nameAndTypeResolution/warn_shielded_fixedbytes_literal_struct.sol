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
// Warning 10412: (98-117): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 10412: (146-165): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
