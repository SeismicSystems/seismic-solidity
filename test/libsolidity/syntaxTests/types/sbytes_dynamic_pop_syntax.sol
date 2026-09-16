// Tests that pop on sbytes compiles without error
// Adapted from array/bytes_pop.sol
contract C {
    sbytes data;
    function test() public {
        data.pop();
    }
}
// ----
// Warning 10305: (104-115): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
