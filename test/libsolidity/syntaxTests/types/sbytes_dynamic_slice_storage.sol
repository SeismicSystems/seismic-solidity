// Tests that slice on sbytes storage is rejected
// Adapted from array/slice/bytes_storage.sol
contract C {
    sbytes x;
    function f() public view {
        x[1:2];
    }
}
// ----
// Warning 9665: (113-121): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 1227: (162-168): Index range access is only supported for dynamic calldata arrays.
