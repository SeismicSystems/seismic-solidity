contract C {
    struct Y {
        suint a;
        uint b;
    }
    mapping(uint256 => Y[]) m;
    mapping(uint256 => Y[3]) n;
    constructor() {
        m[1].push().a = suint(1);
        m[1][0].b = 2;
        m[1].push().a = suint(3);
        m[1][1].b = 4;
        n[1][0].a = suint(7);
        n[1][0].b = 8;
        n[1][1].a = suint(9);
        n[1][1].b = 10;
    }

    function get_m(uint256 x, uint256 y) public view returns (uint256, uint256) {
        return (uint(m[x][y].a), m[x][y].b);
    }

    function get_n(uint256 x, uint256 y) public view returns (uint256, uint256) {
        return (uint(n[x][y].a), n[x][y].b);
    }
}
// ----
// get_m(uint256,uint256): 0, 0 -> FAILURE
// get_m(uint256,uint256): 1, 0 -> 1, 2
// get_m(uint256,uint256): 1, 1 -> 3, 4
// get_m(uint256,uint256): 1, 2 -> FAILURE
// get_n(uint256,uint256): 0, 0 -> 0x00, 0x00
// get_n(uint256,uint256): 1, 0 -> 7, 8
// get_n(uint256,uint256): 1, 1 -> 9, 0x0a
// get_n(uint256,uint256): 1, 2 -> 0x00, 0x00

