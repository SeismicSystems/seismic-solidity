// Tests that slice on sbytes storage is rejected
// Adapted from array/slice/bytes_storage.sol
contract C {
    sbytes x;
    function f() public view {
        x[1:2];
    }
}
// ----
// TypeError 1227: (162-168): Index range access is only supported for dynamic calldata arrays.
