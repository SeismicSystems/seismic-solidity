contract Test {
    struct S {
        suint8 x;
        suint16 y;
        suint256 z;
    }

    function test() public returns (uint256 x, uint256 y, uint256 z) {
        S memory data = combine(suint8(1), suint16(2), suint256(3));
        x = extract(data, 0);
        y = extract(data, 1);
        z = extract(data, 2);
    }

    function extract(S memory s, uint256 which) internal returns (uint256 x) {
        if (which == 0) return uint8(s.x);
        else if (which == 1) return uint16(s.y);
        else return uint256(s.z);
    }

    function combine(suint8 x, suint16 y, suint256 z)
        internal
        returns (S memory s)
    {
        s.x = x;
        s.y = y;
        s.z = z;
    }
}
// ----
// test() -> 1, 2, 3
