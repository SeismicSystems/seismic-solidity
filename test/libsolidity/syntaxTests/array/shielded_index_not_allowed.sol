contract C {
    uint[] arr;
    suint[] shieldedArr;
    
    function test() public {
        suint256 shieldedIndex = suint256(0);
        
        // Should fail: shielded index on regular array
        uint x = arr[shieldedIndex];
        
        // Should fail: shielded index on shielded array
        suint y = shieldedArr[shieldedIndex];
    }
}
// ----
// Warning 9665: (33-52): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 9660: (96-132): Literals converted to shielded integers will leak during contract deployment.
// TypeError 7407: (220-233): Type suint256 is not implicitly convertible to expected type uint256.
// TypeError 5910: (220-233): Shielded types are not allowed as array indices.
