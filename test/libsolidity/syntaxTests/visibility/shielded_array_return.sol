contract C {
    // Test that arrays of shielded types cannot be returned from public/external
    function externalShieldedArray() external pure returns (suint256[] memory) {
        suint256[] memory arr = new suint256[](1);
        arr[0] = suint256(42);
        return arr;
    }

    function publicShieldedArray() public pure returns (suint256[] memory) {
        suint256[] memory arr = new suint256[](1);
        arr[0] = suint256(42);
        return arr;
    }

    // Internal should be allowed
    function internalShieldedArray() internal pure returns (suint256[] memory) {
        suint256[] memory arr = new suint256[](1);
        arr[0] = suint256(42);
        return arr;
    }

    // Private should be allowed
    function privateShieldedArray() private pure returns (suint256[] memory) {
        suint256[] memory arr = new suint256[](1);
        arr[0] = suint256(42);
        return arr;
    }

    // Fixed-size arrays should also be blocked
    function externalFixedShieldedArray() external pure returns (suint256[3] memory) {
        suint256[3] memory arr;
        return arr;
    }

    function publicFixedShieldedArray() public pure returns (suint256[3] memory) {
        suint256[3] memory arr;
        return arr;
    }
}
// ----
// TypeError 7492: (155-172): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// TypeError 7492: (341-358): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// TypeError 7492: (1029-1047): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// TypeError 7492: (1171-1189): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
