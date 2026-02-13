contract C {
    suint32[] arr;
    
    function test() public {
        suint32 idx = suint32(0);
        suint32 x = arr[idx];
    }
}
// ----
// Warning 9660: (88-98): Literals converted to shielded integers will leak during contract deployment.
// TypeError 7407: (124-127): Type suint32 is not implicitly convertible to expected type uint256.
// TypeError 5910: (124-127): Shielded types are not allowed as array indices.
