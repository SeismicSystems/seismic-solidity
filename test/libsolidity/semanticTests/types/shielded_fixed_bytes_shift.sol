contract C {
    suint8 amount;
    bytes32 base;
    sbytes32 stored;
    function run() public returns (bytes32) {
        amount = suint8(4);
        base = bytes32(uint256(0x11));
        stored = base << amount;
        return bytes32(stored);
    }
}
// ====
// EVMVersion: >=mercury
// ----
// run() -> 0x0000000000000000000000000000000000000000000000000000000000000110
