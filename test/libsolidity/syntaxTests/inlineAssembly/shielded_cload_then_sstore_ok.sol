// cload then sstore: passes syntax check (cload doesn't make slot private)
contract C {
    function test() external {
        assembly {
            pop(cload(0))
            sstore(0, 1)
        }
    }
}
// ----
