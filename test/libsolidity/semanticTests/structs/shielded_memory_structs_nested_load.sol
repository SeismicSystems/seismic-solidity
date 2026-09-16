contract Test {
    struct S {
        suint8 x;
        suint16 y;
        suint256 z;
    }
    struct X {
        suint8 x;
        S s;
        suint8[2] a;
    }
    X m_x;

    function load()
        public
        returns (
            uint256 a,
            uint256 x,
            uint256 y,
            uint256 z,
            uint256 a1,
            uint256 a2
        )
    {
        m_x.x = suint8(1);
        m_x.s.x = suint8(2);
        m_x.s.y = suint16(3);
        m_x.s.z = suint256(4);
        m_x.a[0] = suint8(5);
        m_x.a[1] = suint8(6);
        X memory d = m_x;
        a = uint8(d.x);
        x = uint8(d.s.x);
        y = uint16(d.s.y);
        z = uint256(d.s.z);
        a1 = uint8(d.a[0]);
        a2 = uint8(d.a[1]);
    }

    function store()
        public
        returns (
            uint256 a,
            uint256 x,
            uint256 y,
            uint256 z,
            uint256 a1,
            uint256 a2
        )
    {
        X memory d;
        d.x = suint8(1);
        d.s.x = suint8(2);
        d.s.y = suint16(3);
        d.s.z = suint256(4);
        d.a[0] = suint8(5);
        d.a[1] = suint8(6);
        m_x = d;
        a = uint8(m_x.x);
        x = uint8(m_x.s.x);
        y = uint16(m_x.s.y);
        z = uint256(m_x.s.z);
        a1 = uint8(m_x.a[0]);
        a2 = uint8(m_x.a[1]);
    }
}
// ----
// load() -> 0x01, 0x02, 0x03, 0x04, 0x05, 0x06
// store() -> 0x01, 0x02, 0x03, 0x04, 0x05, 0x06
