contract C {
    suint16[] arr;
    
    function test() public {
        suint16 idx = suint16(0);
        suint16 x = arr[idx];
    }
}
// ----
// Warning 9665: (17-30): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 9660: (88-98): Literals converted to shielded integers will leak during contract deployment.
// TypeError 7407: (124-127): Type suint16 is not implicitly convertible to expected type uint256.
// TypeError 5910: (124-127): Shielded types are not allowed as array indices.
