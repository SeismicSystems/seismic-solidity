contract C {
    struct str {
        suint8 a;
        suint16 b;
        suint248 c;
    }
    str data;
    function test() public returns (uint256) {
        data.a = suint8(2);
        if (uint8(data.a) != 2) return 2;
        data.b = suint16(0xabcd);
        if (uint16(data.b) != 0xabcd) return 3;
        data.c = suint248(0x1234567890);
        if (uint248(data.c) != 0x1234567890) return 4;
        if (uint8(data.a) != 2) return 5;
        data.a = suint8(8);
        if (uint8(data.a) != 8) return 6;
        if (uint16(data.b) != 0xabcd) return 7;
        data.b = suint16(0xdcab);
        if (uint16(data.b) != 0xdcab) return 8;
        if (uint248(data.c) != 0x1234567890) return 9;
        data.c = suint248(0x9876543210);
        if (uint248(data.c) != 0x9876543210) return 10;
        return 1;
    }
}
// ----
// test() -> 1
