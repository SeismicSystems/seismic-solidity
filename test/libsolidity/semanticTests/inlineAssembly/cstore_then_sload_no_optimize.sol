contract C {
    function f() public returns (uint ret) {
        assembly {
            cstore(0, 42)
            ret := sload(0)
        }
    }
}
// ----
// f() -> FAILURE
