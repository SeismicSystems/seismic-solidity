contract C {
    sbytes1 private a;
    sbytes2 private b;
    sbytes4 private c;
    sbytes8 private d;
    sbytes16 private e;
    sbytes32 private f;

    function test() internal {
        a = sbytes1(0xFF);
        b = sbytes2(0xFFFF);
        c = sbytes4(0xFFFFFFFF);
        d = sbytes8(0xFFFFFFFFFFFFFFFF);
        e = sbytes16(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
        f = sbytes32(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
    }
}
// ----
// Warning 9663: (197-210): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (224-239): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (253-272): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (286-313): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (327-371): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (385-461): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
