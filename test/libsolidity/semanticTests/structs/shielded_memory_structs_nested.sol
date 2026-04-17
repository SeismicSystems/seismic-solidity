contract Test {
    struct S {
        suint8 x;
        suint16 y;
        suint256 z;
    }
    struct X {
        suint8 x;
        S s;
    }

    function test()
        public
        returns (uint256 a, uint256 x, uint256 y, uint256 z)
    {
        X memory d = combine(suint8(1), suint8(2), suint16(3), suint256(4));
        a = extract(d, 0);
        x = extract(d, 1);
        y = extract(d, 2);
        z = extract(d, 3);
    }

    function extract(X memory s, uint256 which) internal returns (uint256 x) {
        if (which == 0) return uint8(s.x);
        else if (which == 1) return uint8(s.s.x);
        else if (which == 2) return uint16(s.s.y);
        else return uint256(s.s.z);
    }

    function combine(suint8 a, suint8 x, suint16 y, suint256 z)
        internal
        returns (X memory s)
    {
        s.x = a;
        s.s.x = x;
        s.s.y = y;
        s.s.z = z;
    }
}
// ----
// test() -> 1, 2, 3, 4
