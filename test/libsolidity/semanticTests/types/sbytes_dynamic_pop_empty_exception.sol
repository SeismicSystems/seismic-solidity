// Tests that pop on empty sbytes reverts with Panic(0x31)
// Adapted from byte_array_pop_empty_exception.sol
contract C {
    uint256 a;
    uint256 b;
    uint256 c;
    sbytes data;

    function test() public returns (bool) {
        data.pop();
        return true;
    }
}
// ----
// test() -> FAILURE, hex"4e487b71", 0x31
