contract C {
    suint8 private secret;
    suint256 stored;
    // public value shifted by a shielded amount -> shielded result -> cannot be returned publicly
    function leakReturn(uint256 base) external view returns (uint256) {
        return base << secret;
    }
    function leakAssign(uint256 base) external view returns (uint256 r) {
        r = base << secret;
    }
    // shifting in a shielded context stays legal
    function shieldedOk() external {
        suint256 x;
        stored = x << secret;
    }
    // public base shifted by a shielded amount -> shielded result, legal into a shielded sink
    function publicBaseIntoShielded(uint256 base) external {
        stored = base << secret;
    }
}
// ----
// TypeError 6359: (247-261): Return argument type suint256 is not implicitly convertible to expected type (type of first return variable) uint256.
// TypeError 7407: (355-369): Type suint256 is not implicitly convertible to expected type uint256.
