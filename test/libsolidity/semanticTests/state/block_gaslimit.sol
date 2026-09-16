contract C {
    function f() public returns (uint) {
        return block.gaslimit;
    }
}
// ----
// f() -> 30000000
// f() -> 30000000
// f() -> 30000000
