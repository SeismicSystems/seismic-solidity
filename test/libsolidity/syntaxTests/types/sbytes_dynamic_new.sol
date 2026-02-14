contract C {
    function testNew() internal pure {
        sbytes memory m = new sbytes(32);
        m[0] = sbytes1(0x01);
        m[31] = sbytes1(0xFF);
    }

    function testNewZero() internal pure {
        sbytes memory m = new sbytes(0);
    }
}
// ----
// Warning 9663: (109-122): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (140-153): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 2072: (213-228): Unused local variable.
