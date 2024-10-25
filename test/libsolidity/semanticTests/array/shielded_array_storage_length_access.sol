contract C {
    suint[] storageArray;
    function set_get_length(suint256 len) public returns (suint256) {
        while(storageArray.length < len)
            storageArray.push();
        return storageArray.length;
    }
}
// ----
// set_get_length(suint256): 0 -> 0
// set_get_length(suint256): 1 -> 1
// set_get_length(suint256): 10 -> 10
// set_get_length(suint256): 20 -> 20
// set_get_length(suint256): 0xFF -> 0xFF
// gas irOptimized: 96690
// gas legacy: 128571
// gas legacyOptimized: 110143
// set_get_length(suint256): 0xFFF -> 0xFFF
// gas irOptimized: 1209116
// gas legacy: 1689548
// gas legacyOptimized: 1393535
// set_get_length(suint256): 0xFFFFF -> FAILURE # Out-of-gas #
