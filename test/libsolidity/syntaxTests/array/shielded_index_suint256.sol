contract C {
    suint256[] arr;
    
    function test() public {
        suint256 idx = suint256(0);
        suint256 x = arr[idx];
    }
}
// ----
// Warning 9660: (75-101): Literals converted to shielded integers will leak during contract deployment.
// TypeError 7407: (128-131): Type suint256 is not implicitly convertible to expected type uint256.
// TypeError 5910: (128-131): Shielded types are not allowed as array indices.