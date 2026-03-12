// Byte array helpers (resize, push, pop, transitLongToShort) apply to
// bytes/string and sbytes. sbytesN is a fixed-size value type that does
// not route through byte array helpers.
contract C {
    bytes public b;
    string public s;
    sbytes32 sb;

    // bytes/string use byte array storage helpers (sload/sstore only)
    function testBytesPushPop() public {
        b.push(0x01);
        b.push(0x02);
        b.pop();
    }

    function testBytesResize() public {
        b = new bytes(64);
        b = new bytes(16);
        b = new bytes(0);
    }

    function testStringAssign() public {
        s = "short";
        s = "this is a long string that exceeds thirty two bytes in length!!";
        s = "";
    }

    // sbytesN is a fixed-size value type, not a dynamic byte array
    function testSbytesN() public {
        sb = sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
    }
}
// ----
// Warning 10412: (845-921): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
