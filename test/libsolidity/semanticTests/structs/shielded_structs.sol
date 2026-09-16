contract test {
    struct s1 {
        suint8 x;
        sbool y;
    }
    struct s2 {
        suint32 z;
        s1 s1data;
        mapping(uint8 => s2) recursive;
    }
    s2 data;
    function check() public returns (bool ok) {
        return uint32(data.z) == 1 && uint8(data.s1data.x) == 2 &&
            bool(data.s1data.y) == true &&
            uint32(data.recursive[3].recursive[4].z) == 5 &&
            uint32(data.recursive[4].recursive[3].z) == 6 &&
            bool(data.recursive[0].s1data.y) == false &&
            uint32(data.recursive[4].z) == 9;
    }
    function set() public {
        data.z = suint32(1);
        data.s1data.x = suint8(2);
        data.s1data.y = sbool(true);
        data.recursive[3].recursive[4].z = suint32(5);
        data.recursive[4].recursive[3].z = suint32(6);
        data.recursive[0].s1data.y = sbool(false);
        data.recursive[4].z = suint32(9);
    }
}
// ----
// check() -> false
// set() ->
// check() -> true
