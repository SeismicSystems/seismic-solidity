contract C {
    suint[] storageArray;
    function test_indices(uint256 len) public
    {
        while (storageArray.length < suint(len))
            storageArray.push();
        while (storageArray.length > suint(len))
            storageArray.pop();
        for (uint i = 0; i < len; i++)
            storageArray[i] = suint(i) + suint(1);
        for (uint i = 0; i < len; i++)
            require(storageArray[i] == suint(i) + suint(1));
    }
}
// ----
// test_indices(uint256): 1 ->
// test_indices(uint256): 129 ->
// gas irOptimized: 5718487
// gas legacy: 5739468
// gas legacyOptimized: 5696764
// test_indices(uint256): 5 ->
// gas irOptimized: 3196070
// gas legacy: 3190221
// gas legacyOptimized: 3188247
// test_indices(uint256): 10 ->
// gas irOptimized: 263453
// gas legacy: 265622
// gas legacyOptimized: 262496
// test_indices(uint256): 15 ->
// gas irOptimized: 278233
// gas legacy: 281487
// gas legacyOptimized: 277096
// test_indices(uint256): 0xFF ->
// gas irOptimized: 10737823
// gas legacy: 10779762
// gas legacyOptimized: 10696556
// test_indices(uint256): 511 ->
// gas irOptimized: 21600000
// gas legacy: 21800000
// gas legacyOptimized: 21500000
// test_indices(uint256): 129 ->
// gas irOptimized: 15000000
// gas legacy: 15200000
// gas legacyOptimized: 14900000
// test_indices(uint256): 128 ->
// gas irOptimized: 426622
// gas legacy: 454612
// gas legacyOptimized: 422009
// test_indices(uint256): 1 ->
// gas irOptimized: 3263137
// gas legacy: 3256426
// gas legacyOptimized: 3255242
