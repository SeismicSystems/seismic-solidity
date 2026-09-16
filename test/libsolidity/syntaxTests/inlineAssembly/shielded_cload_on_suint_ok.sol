contract C {
    suint x;
    function f() external view returns (uint r) {
        assembly {
            r := cload(x.slot)
        }
    }
}
// ----
