contract C {
    sbool x;
    function f() external {
        assembly {
            cstore(x.slot, 1)
        }
    }
}
// ----
