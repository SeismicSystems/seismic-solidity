// Bug: shielded literal shifted by non-shielded variable should produce shielded result
contract C {
    suint256 private x;

    function test(uint8 amount) internal {
        // Shielded literal with non-shielded shift amount
        x = 1s << amount;
        // Shielded literal with non-shielded exponent
        x = 2s ** amount;
    }
}
// ----
// Warning 9660: (241-243): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (241-253): Type uint256 is not implicitly convertible to expected type suint256.
// Warning 9660: (322-324): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (322-334): Type uint256 is not implicitly convertible to expected type suint256.
