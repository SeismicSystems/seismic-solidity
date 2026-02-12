contract C {
    suint8[] arr;
    
    function test() public {
        suint8 idx = suint8(0);
        suint8 x = arr[idx];
    }
}
// ----
// Warning 9665: (17-29): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 9660: (86-95): Literals converted to shielded integers will leak during contract deployment.
// TypeError 7407: (120-123): Type suint8 is not implicitly convertible to expected type uint256.
// TypeError 5910: (120-123): Shielded types are not allowed as array indices.
