contract C {
    suint x;
    function f() external view returns (uint r) {
        assembly {
            r := sload(x.slot)
        }
    }
}
// ----
// TypeError 10308: (112-125): Cannot use sload() on shielded storage variable. Use cload() instead.
