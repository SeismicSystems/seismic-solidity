contract C {
    sbytes data;

    function testStorage() internal {
        sbytes storage ref = data;
        ref.push(sbytes1(0x42));
    }

    function testMemory() internal pure {
        sbytes memory m = new sbytes(10);
        m[0] = sbytes1(0x01);
    }
}
// ----
// Warning 9665: (17-28): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
