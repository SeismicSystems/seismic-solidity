contract C {
    struct X {
        suint256 x1;
        suint256 x2;
    }
    struct S {
        suint256 s1;
        suint256[3] s2;
        X s3;
    }
    S s;

    constructor() {
        suint256[3] memory s2;
        s2[1] = suint256(9);
        s = S(suint256(1), s2, X(suint256(4), suint256(5)));
    }

    function get()
        public
        returns (uint256 s1, uint256[3] memory s2, uint256 x1, uint256 x2)
    {
        s1 = uint256(s.s1);
        s2[0] = uint256(s.s2[0]);
        s2[1] = uint256(s.s2[1]);
        s2[2] = uint256(s.s2[2]);
        x1 = uint256(s.s3.x1);
        x2 = uint256(s.s3.x2);
    }
}
// ----
// get() -> 0x01, 0x00, 0x09, 0x00, 0x04, 0x05
