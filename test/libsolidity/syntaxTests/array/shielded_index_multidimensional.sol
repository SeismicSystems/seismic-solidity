contract C {
    suint256[][] arr;
    
    function test() public {
        suint256 idx1 = suint256(0);
        suint256 idx2 = suint256(1);
        suint256 x = arr[idx1][idx2];
    }
}
// ----
// Warning 9665: (17-33): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 9660: (93-104): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (130-141): Literals converted to shielded integers will leak during contract deployment.
// TypeError 7407: (168-172): Type suint256 is not implicitly convertible to expected type uint256.
// TypeError 10106: (168-172): Shielded types are not allowed as array indices.
