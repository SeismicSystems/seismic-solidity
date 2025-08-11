contract C {
    suint16[] arr;
    
    function test() public {
        suint16 idx = suint16(0);
        suint16 x = arr[idx];
    }
}
// ----
// Warning 9660: (74-98): Literals converted to shielded integers will leak during contract deployment.
// TypeError 7407: (124-127): Type suint16 is not implicitly convertible to expected type uint256.
// TypeError 5910: (124-127): Shielded types are not allowed as array indices.