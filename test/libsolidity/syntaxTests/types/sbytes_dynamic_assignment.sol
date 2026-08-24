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
// Warning 10305: (17-29): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 10305: (35-47): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 2072: (224-240): Unused local variable.
