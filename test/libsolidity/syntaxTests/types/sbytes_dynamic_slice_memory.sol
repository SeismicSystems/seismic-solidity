// Tests that slice on sbytes memory is rejected
// Adapted from array/slice/bytes_memory.sol
contract C {
    function f(sbytes memory x) internal pure {
        x[1:2];
    }
}
// ----
// TypeError 1227: (163-169): Index range access is only supported for dynamic calldata arrays.
