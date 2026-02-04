contract C {
    suint256[] a;

    function f() public returns (uint256) {
        suint256[] storage x = a;
        suint256 off;
        assembly {
            sstore(x.slot, 7)
            off := x.offset
        }
        assert(bool(off == suint(0)));
        return uint(a.length);
    }
}
// ----
// f() -> 7
