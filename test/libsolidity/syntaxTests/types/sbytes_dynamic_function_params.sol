contract C {
    // Internal should be allowed
    function internalFn(sbytes memory data) internal pure returns (uint256) {
        return 0;
    }

    // Private should be allowed
    function privateFn(sbytes memory data) private pure returns (uint256) {
        return 0;
    }

    // External is allowed (shielded parameters accepted in external functions)
    function externalFn(sbytes memory data) external pure returns (uint256) {
        return 0;
    }

    // Public is allowed (shielded parameters accepted in public functions)
    function publicFn(sbytes memory data) public pure returns (uint256) {
        return 0;
    }
}
// ----
// Warning 5667: (71-89): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 5667: (206-224): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 5667: (388-406): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 5667: (565-583): Unused function parameter. Remove or comment out the variable name to silence this warning.
