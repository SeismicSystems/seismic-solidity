contract C {
    suint256[] public a;

    function f() public returns (suint256) {
        suint256[] storage x = a;
        suint256 off;
        assembly {
            cstore(x.slot, 7)
            off := x.offset
        }
        assert(off == 0);
        return a.length;
    }
}
// ----
// f() -> 7
