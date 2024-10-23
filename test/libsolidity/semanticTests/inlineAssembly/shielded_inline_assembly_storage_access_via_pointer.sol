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
            sstore(x.slot, 7)
            off := x.offset
        }
        assert(off == 0);
        return true;
    }

    function get_a() public returns (suint256) {
        return a.contents;
    }

    function get_separator() public returns (suint256) {
        return separator;
    }

    function get_separator2() public returns (suint256) {
        return separator2;
    }
}
// ----
// f() -> true
// get_a() -> 7
// get_separator() -> 0
// get_separator2() -> 0
