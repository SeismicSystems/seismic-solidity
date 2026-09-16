// sstore then cstore: passes syntax check (runtime error only if sstore wrote non-zero)
contract C {
    function test() external {
        assembly {
            sstore(0, 0)
            cstore(0, 1)
        }
    }
}
// ----
