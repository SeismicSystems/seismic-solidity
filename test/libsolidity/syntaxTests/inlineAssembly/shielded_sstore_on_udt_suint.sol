type MyShieldedUint is suint256;

contract C {
    MyShieldedUint x;
    function f() external {
        assembly {
            sstore(x.slot, 42)
        }
    }
}
// ----
// TypeError 5765: (128-146): Cannot use sstore() on shielded storage variable. Use cstore() instead.
