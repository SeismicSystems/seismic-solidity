contract C {
    sbytes data1;
    sbytes data2;

    function testAssignment() internal {
        data1 = data2;
    }

    function testMemoryAssignment() internal pure {
        sbytes memory m1 = new sbytes(10);
        sbytes memory m2 = m1;
    }
}
// ----
// Warning 2072: (224-240): Unused local variable.
