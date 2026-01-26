contract C {
    function f() public pure returns (uint256 tsMs) {
        assembly {
            tsMs := timestampms()
        }
    }
}
// ----
// TypeError 2527: (106-119): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
