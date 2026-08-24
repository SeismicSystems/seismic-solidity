contract C {
    suint[] storageArray;
    function test_zeroed_indices(uint256 len) public
    {
        while(storageArray.length < suint(len))
            storageArray.push();
        while(storageArray.length > suint(len))
            storageArray.pop();

        for (uint i = 0; i < len; i++)
            storageArray[i] = suint(i) + suint(1);

        if (suint(len) > suint(3))
        {
            while(storageArray.length > suint(0))
                storageArray.pop();
            while(storageArray.length < suint(3))
                storageArray.push();

            for (uint i = 3; i < len; i++)
            {
                assembly {
                    mstore(0, storageArray.slot)
                    let pos := add(keccak256(0, 0x20), i)

                    if iszero(eq(cload(pos), 0)) {
                        revert(0, 0)
                    }
                }
            }

        }

        while(storageArray.length > suint(0))
            storageArray.pop();
        while(storageArray.length < suint(len))
            storageArray.push();

        for (uint i = 0; i < len; i++)
        {
            require(storageArray[i] == suint(0));

            suint256 val = storageArray[i];
            suint256 check;

            assembly { check := iszero(val) }

            require(check == suint(1));
        }
    }
}
// ----
// test_zeroed_indices(uint256): 1 ->
// test_zeroed_indices(uint256): 5 ->
// gas irOptimized: 555763
// gas legacy: 553664
// gas legacyOptimized: 551990
// test_zeroed_indices(uint256): 10 ->
// gas irOptimized: 882656
// gas legacy: 879315
// gas legacyOptimized: 876451
// test_zeroed_indices(uint256): 15 ->
// gas irOptimized: 1192460
// gas legacy: 1187999
// gas legacyOptimized: 1184007
// test_zeroed_indices(uint256): 128 ->
// gas irOptimized: 14700000
// gas legacy: 14700000
// gas legacyOptimized: 14700000

