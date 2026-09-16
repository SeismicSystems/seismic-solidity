contract test {
    struct Data { suint256 a; suint8 b; mapping(uint => uint) c; sbool d; }
    mapping(uint => Data) private data;
    constructor() {
        data[7].a = suint256(1);
        data[7].b = suint8(2);
        data[7].c[0] = 3;
        data[7].d = sbool(true);
    }
    function getData(uint256 key) public returns (uint256, uint8, bool) {
        Data storage d = data[key];
        return (uint256(d.a), uint8(d.b), bool(d.d));
    }
}
// ----
// getData(uint256): 7 -> 1, 2, true
