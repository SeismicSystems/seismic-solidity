contract C {
    constructor() {
        sbytes4 x = sbytes4("abcd");
        sbytes8 y = sbytes8("12345678");
    }
}
// ----
// Warning 10412: (53-68): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 10412: (90-109): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 2072: (41-50): Unused local variable.
// Warning 2072: (78-87): Unused local variable.
