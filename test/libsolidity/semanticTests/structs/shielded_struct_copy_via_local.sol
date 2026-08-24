contract c {
    struct Struct {
        suint256 a;
        suint256 b;
    }
    uint[75] r;
    Struct data1;
    Struct data2;

    function test() public returns (bool) {
        data1.a = suint256(1);
        data1.b = suint256(2);
        Struct memory x = data1;
        data2 = x;
        return uint256(data2.a) == uint256(data1.a) && uint256(data2.b) == uint256(data1.b);
    }
}
// ----
// test() -> true
