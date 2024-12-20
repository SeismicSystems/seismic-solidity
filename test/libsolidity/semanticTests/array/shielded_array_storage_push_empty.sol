contract C {
    suint256[] storageArray;
    function pushEmpty(suint256 len) public {
        while(storageArray.length < len)
            storageArray.push();

        for (suint i = suint(0); i < len; i++)
            require(storageArray[i] == suint(0));
    }
}
// ====
// EVMVersion: >=petersburg
// ----
// pushEmpty(suint256): 128
// gas irOptimized: 410745
// gas legacy: 400519
// gas legacyOptimized: 388804
// pushEmpty(suint256): 256
// gas irOptimized: 698285
// gas legacy: 684859
// gas legacyOptimized: 671480
// pushEmpty(suint256): 38869 -> FAILURE # out-of-gas #
// gas irOptimized: 100000000
// gas legacy: 100000000
// gas legacyOptimized: 100000000

