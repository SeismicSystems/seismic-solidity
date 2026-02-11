contract C {
    // Internal should be allowed
    function internalFn(sbytes memory data) internal pure returns (uint256) {
        return 0;
    }

    // Private should be allowed
    function privateFn(sbytes memory data) private pure returns (uint256) {
        return 0;
    }

    // External should be rejected (shielded parameter)
    function externalFn(sbytes memory data) external pure returns (uint256) {
        return 0;
    }

    // Public should be rejected (shielded parameter)
    function publicFn(sbytes memory data) public pure returns (uint256) {
        return 0;
    }
}
// ----
// Warning 5667: (71-89): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 5667: (206-224): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 5667: (364-382): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 5667: (519-537): Unused function parameter. Remove or comment out the variable name to silence this warning.
