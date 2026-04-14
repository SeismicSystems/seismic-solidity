contract test {
    struct s2 {
        suint32 z;
        mapping(uint8 => s2) recursive;
    }
    s2 data;
    function check() public returns (bool ok) {
        return uint32(data.z) == 2 &&
            uint32(data.recursive[0].z) == 3 &&
            uint32(data.recursive[0].recursive[1].z) == 0 &&
            uint32(data.recursive[0].recursive[0].z) == 1;
    }
    function set() public {
        data.z = suint32(2);
        mapping(uint8 => s2) storage map = data.recursive;
        s2 storage inner = map[0];
        inner.z = suint32(3);
        inner.recursive[0].z = suint32(uint32(inner.recursive[1].z) + 1);
    }
}
// ----
// check() -> false
// set() ->
// check() -> true
