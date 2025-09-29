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
// TypeError 7407: (198-216): Type suint256 is not implicitly convertible to expected type uint256.
// TypeError 5910: (198-216): Shielded types are not allowed as array indices.