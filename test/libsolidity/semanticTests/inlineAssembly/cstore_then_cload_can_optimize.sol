contract C {
    function f() public returns (uint ret) {
        assembly {
            cstore(0, 42)
            ret := cload(0)
        }
    }
}
// ----
// f() -> 42
