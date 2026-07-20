contract C {
    function f() public pure returns (uint256 t) {
        assembly {
            t := txtype()
        }
    }
}
// ----
// TypeError 2527: (100-108): Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
