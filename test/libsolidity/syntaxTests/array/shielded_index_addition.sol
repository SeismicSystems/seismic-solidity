contract C {
    suint256[] arr;
    
    function test() public {
        suint256 shieldedVar = suint256(1);
        suint256 x = arr[shieldedVar + suint256(1)];
    }
}
// ----
// Warning 9660: (98-109): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (150-161): Literals converted to shielded integers will leak during contract deployment.
// TypeError 7407: (136-161): Type suint256 is not implicitly convertible to expected type uint256.
// TypeError 5910: (136-161): Shielded types are not allowed as array indices.
