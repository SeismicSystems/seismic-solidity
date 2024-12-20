contract C {
    struct Data {
        suint256 contents;
    }
    suint256 separator;
    Data a;
    suint256 separator2;

    function f() public returns (bool) {
        Data storage x = a;
        suint256 off;
        assembly {
            cstore(x.slot, 7)
            off := x.offset
        }
        assert(off == suint(0));
        return true;
    }

    function get_a() public returns (uint256) {
        return uint256(a.contents);
    }

    function get_separator() public returns (uint256) {
        return uint256(separator);
    }

    function get_separator2() public returns (uint256) {
        return uint256(separator2);
    }
}
// ----
// f() -> true
// get_a() -> 7
// get_separator() -> 0
// get_separator2() -> 0
