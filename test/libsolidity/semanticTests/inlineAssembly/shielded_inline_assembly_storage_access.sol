contract C {
    suint16 x;
    suint16 y;
    suint256 z;

    function getZ() public returns (uint256) { return uint(z); }

    function f() public returns (bool) {
        suint256 off1;
        suint256 off2;
        assembly {
            cstore(z.slot, 7)
            off1 := z.offset
            off2 := y.offset
        }
        require(off1 == 0);
        require(off2 == 0);
        return true;
    }
}
// ----
// f() -> true
// getZ() -> 7
