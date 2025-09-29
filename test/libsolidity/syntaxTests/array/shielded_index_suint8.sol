contract C {
    suint8[] arr;
    
    function test() public {
        suint8 idx = suint8(0);
        suint8 x = arr[idx];
    }
}
// ----
// Warning 9660: (73-95): Literals converted to shielded integers will leak during contract deployment.
// TypeError 7407: (120-123): Type suint8 is not implicitly convertible to expected type uint256.
// TypeError 5910: (120-123): Shielded types are not allowed as array indices.