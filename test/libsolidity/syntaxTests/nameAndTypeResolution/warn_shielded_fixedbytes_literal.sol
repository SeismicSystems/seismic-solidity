contract C {
    constructor() {
        sbytes4 x = sbytes4(0x01020304);
        sbytes8 y = sbytes8(0x0102030405060708);
    }
}
// ----
// Warning 10412: (53-72): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 10412: (94-121): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 2072: (41-50): Unused local variable.
// Warning 2072: (82-91): Unused local variable.
