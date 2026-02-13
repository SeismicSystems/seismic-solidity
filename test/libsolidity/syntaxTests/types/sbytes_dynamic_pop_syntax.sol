// Tests that pop on sbytes compiles without error
// Adapted from array/bytes_pop.sol
contract C {
    sbytes data;
    function test() public {
        data.pop();
    }
}
// ----
