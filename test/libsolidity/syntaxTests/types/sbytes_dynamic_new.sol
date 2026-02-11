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
// Warning 2072: (213-228): Unused local variable.
