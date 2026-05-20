contract T {
    sbytes private secret;
    function f() public {
        assembly { sstore(secret.slot, 0) }
    }
}
// ----
// Warning 10305: (17-38): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 10308: (85-107): Cannot use sstore() on shielded storage variable. Use cstore() instead.
