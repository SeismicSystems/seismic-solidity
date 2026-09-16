contract T {
    sbytes private secret;
    function leak() public view returns (uint256 v) {
        assembly { v := sload(secret.slot) }
    }
}
// ----
// Warning 10305: (17-38): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 10308: (118-136): Cannot use sload() on shielded storage variable. Use cload() instead.
