contract C {
    function f() public returns (uint ret) {
        assembly {
            sstore(0, 42)
            ret := sload(0)
        }
    }
}
// ----
// f() -> 42
