contract C {
    suint256[] a;

    function f() public returns (uint256) {
        suint256[] storage x = a;
        suint256 off;
        assembly {
            cstore(x.slot, 7)
            off := x.offset
        }
        assert(off == 0);
        return uint(a.length);
    }
}
// ----
// f() -> 7
