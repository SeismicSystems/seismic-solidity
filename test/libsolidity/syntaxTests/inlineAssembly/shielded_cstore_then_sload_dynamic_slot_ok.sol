// Known limitation: dynamic slot prevents compile-time detection.
// cstore(0, 0) then sload(slot) with dynamic slot cannot be matched statically.
// Will revert at runtime if slot == 0.
contract C {
    function test(uint slot) external returns (uint c) {
        assembly {
            cstore(0, 0)
            c := sload(slot)
        }
    }
}
// ----
