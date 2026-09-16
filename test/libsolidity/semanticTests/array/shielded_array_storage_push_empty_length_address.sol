contract C {
    saddress[] addressArray;
    function set_get_length(uint256 len) public returns (uint256)
    {
        while(addressArray.length < suint(len))
            addressArray.push();
        while(addressArray.length > suint(len))
            addressArray.pop();
        return uint(addressArray.length);
    }
}
// ====
// EVMVersion: >=Mercury
// ----
// set_get_length(uint256): 0 -> 0
// set_get_length(uint256): 1 -> 1
// set_get_length(uint256): 10 -> 10
// set_get_length(uint256): 20 -> 20
// set_get_length(uint256): 0 -> 0
// gas irOptimized: 500000
// gas legacy: 500000
// gas legacyOptimized: 499000
// set_get_length(uint256): 0xFF -> 0xFF
// gas irOptimized: 5550000
// gas legacy: 6078000
// gas legacyOptimized: 5516000
// set_get_length(uint256): 511 -> 511
// gas irOptimized: 11800000
// gas legacy: 12300000
// gas legacyOptimized: 11750000
