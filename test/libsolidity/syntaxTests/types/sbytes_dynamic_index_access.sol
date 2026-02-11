contract C {
    sbytes data;

    function testRead() internal view returns (sbytes1) {
        return data[0];
    }

    function testWrite() internal {
        data[0] = sbytes1(0x42);
    }

    function testReadMemory() internal pure {
        sbytes memory m = new sbytes(5);
        sbytes1 val = m[0];
    }
}
// ----
// Warning 9665: (17-28): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 2072: (291-302): Unused local variable.
