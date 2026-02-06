contract C {
    suint[] storageArray;
    function set_get_length(uint256 len) public returns (uint256) {
        while(storageArray.length < suint(len))
            storageArray.push();
        return uint(storageArray.length);
    }
}
// ----
// set_get_length(uint256): 0 -> 0
// set_get_length(uint256): 1 -> 1
// set_get_length(uint256): 10 -> 10
// set_get_length(uint256): 20 -> 20
// set_get_length(uint256): 0xFF -> 0xFF
// gas irOptimized: 5055000
// gas legacy: 5087000
// gas legacyOptimized: 5069000
// set_get_length(uint256): 511 -> 511
// gas irOptimized: 11790000
// gas legacy: 11820000
// gas legacyOptimized: 11800000
