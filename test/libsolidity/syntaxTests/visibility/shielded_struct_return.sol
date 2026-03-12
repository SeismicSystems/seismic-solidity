contract C {
    // Struct containing shielded field
    struct SecretData {
        uint256 publicValue;
        suint256 secretValue;
    }

    // Test that struct with shielded field cannot be returned from public/external
    function externalStructWithShielded() external pure returns (SecretData memory) {
        return SecretData(1, suint256(2));
    }

    function publicStructWithShielded() public pure returns (SecretData memory) {
        return SecretData(1, suint256(2));
    }

    // Internal should be allowed
    function internalStructWithShielded() internal pure returns (SecretData memory) {
        return SecretData(1, suint256(2));
    }

    // Private should be allowed
    function privateStructWithShielded() private pure returns (SecretData memory) {
        return SecretData(1, suint256(2));
    }
}
// ----
// TypeError 10102: (292-309): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// Warning 9660: (342-353): Literals converted to shielded integers will leak during contract deployment.
// TypeError 10102: (424-441): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// Warning 9660: (474-485): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (644-655): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (811-822): Literals converted to shielded integers will leak during contract deployment.
