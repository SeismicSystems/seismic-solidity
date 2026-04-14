contract c {
    struct Nested {
        suint256 x;
        suint256 y;
    }
    struct Struct {
        suint256 a;
        Nested nested;
        suint256 c;
    }
    Struct data;

    function set() public returns (bool) {
        data.a = suint256(1);
        data.nested.x = suint256(2);
        data.nested.y = suint256(3);
        data.c = suint256(4);
        return true;
    }

    function copy() public returns (bool) {
        Struct memory m = data;
        Struct memory n;
        n = m;
        return uint256(n.a) == 1 && uint256(n.nested.x) == 2 &&
               uint256(n.nested.y) == 3 && uint256(n.c) == 4;
    }

    function retrieve() public returns (uint256 a, uint256 x, uint256 y, uint256 c) {
        a = uint256(data.a);
        x = uint256(data.nested.x);
        y = uint256(data.nested.y);
        c = uint256(data.c);
    }
}
// ----
// set() -> true
// retrieve() -> 1, 2, 3, 4
// copy() -> true
