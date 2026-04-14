contract Test {
    struct S {
        suint8 x;
        suint16 y;
        suint256 z;
        suint8[2] a;
    }
    S[5] data;

    function testInit()
        public
        returns (uint8 x, uint16 y, uint256 z, uint8 a, bool flag)
    {
        S[2] memory d;
        x = uint8(d[0].x);
        y = uint16(d[0].y);
        z = uint256(d[0].z);
        a = uint8(d[0].a[1]);
        flag = true;
    }

    function testCopyRead()
        public
        returns (uint8 x, uint16 y, uint256 z, uint8 a)
    {
        data[2].x = suint8(1);
        data[2].y = suint16(2);
        data[2].z = suint256(3);
        data[2].a[1] = suint8(4);
        S memory s = data[2];
        x = uint8(s.x);
        y = uint16(s.y);
        z = uint256(s.z);
        a = uint8(s.a[1]);
    }

    function testAssign()
        public
        returns (uint8 x, uint16 y, uint256 z, uint8 a)
    {
        S memory s;
        s.x = suint8(1);
        s.y = suint16(2);
        s.z = suint256(3);
        s.a[1] = suint8(4);
        x = uint8(s.x);
        y = uint16(s.y);
        z = uint256(s.z);
        a = uint8(s.a[1]);
    }
}
// ----
// testInit() -> 0, 0, 0, 0, true
// testCopyRead() -> 1, 2, 3, 4
// testAssign() -> 1, 2, 3, 4
