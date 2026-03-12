contract C {
    suint256[] arr;
    
    function getShieldedIndex() internal pure returns (suint256) {
        return suint256(0);
    }
    
    function test() public {
        suint256 x = arr[getShieldedIndex()];
    }
}
// ----
// Warning 9665: (17-31): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 9660: (120-131): Literals converted to shielded integers will leak during contract deployment.
// TypeError 7407: (198-216): Type suint256 is not implicitly convertible to expected type uint256.
// TypeError 10106: (198-216): Shielded types are not allowed as array indices.
