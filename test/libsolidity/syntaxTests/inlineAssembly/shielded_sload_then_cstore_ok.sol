// sload then cstore: passes syntax check (runtime error only if slot had non-zero value)
contract C {
    function test() external {
        assembly {
            pop(sload(0))
            cstore(0, 1)
        }
    }
}
// ----
