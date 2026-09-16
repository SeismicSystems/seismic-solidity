contract C {
    suint x;
    function f() external {
        assembly {
            cstore(x.slot, 42)
        }
    }
}
// ----
