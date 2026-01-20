contract C {
    function f() public returns (uint ret) {
        assembly {
            sstore(0, 42)
            ret := cload(0)
        }
    }
}
// ----
// f() -> FAILURE
