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
    mapping(uint256 => Struct) data;

    function set(uint256 k) public returns (bool) {
        data[k].a = suint256(1);
        data[k].nested.x = suint256(3);
        data[k].nested.y = suint256(4);
        data[k].c = suint256(2);
        return true;
    }

    function copy(uint256 from, uint256 to) public returns (bool) {
        data[to] = data[from];
        return true;
    }

    function retrieve(uint256 k)
        public
        returns (uint256 a, uint256 x, uint256 y, uint256 c)
    {
        a = uint256(data[k].a);
        x = uint256(data[k].nested.x);
        y = uint256(data[k].nested.y);
        c = uint256(data[k].c);
    }
}
// ----
// set(uint256): 7 -> true
// retrieve(uint256): 7 -> 1, 3, 4, 2
// copy(uint256,uint256): 7, 8 -> true
// retrieve(uint256): 7 -> 1, 3, 4, 2
// retrieve(uint256): 8 -> 1, 3, 4, 2
// copy(uint256,uint256): 0, 7 -> true
// retrieve(uint256): 7 -> 0, 0, 0, 0
// retrieve(uint256): 8 -> 1, 3, 4, 2
// copy(uint256,uint256): 7, 8 -> true
// retrieve(uint256): 8 -> 0, 0, 0, 0
