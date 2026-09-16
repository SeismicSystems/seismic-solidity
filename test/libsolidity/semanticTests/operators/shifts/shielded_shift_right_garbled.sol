contract C {
    suint8 tmp;
    function f(suint8 a, suint8 b) public returns (uint256) {
        assembly {
            cstore(tmp.slot, 0xffffffff)
        }
        // Higher bits should be cleared before the shift
        return uint256(tmp >> b);
    }
}
// ----
// f(suint8,suint8): 0x00, 0x04 -> 0x0f
// f(suint8,suint8): 0x00, 0x1004 -> FAILURE
