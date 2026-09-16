// Tests push 1..39, verify short-to-long transition tracks length and last element
// Each push is verified individually (last element only)
// Adapted from byte_array_push_transition.sol
contract C {
    sbytes data;

    function test() public returns (uint256) {
        for (uint8 i = 1; i < 40; i++) {
            data.push(sbytes1(uint8(i)));
            if (uint256(suint256(data.length)) != i) return 0x1000 + i;
            if (data[uint256(suint256(data.length)) - 1] != sbytes1(uint8(i))) return i;
        }
        return 0;
    }
}
// ----
// test() -> 0
