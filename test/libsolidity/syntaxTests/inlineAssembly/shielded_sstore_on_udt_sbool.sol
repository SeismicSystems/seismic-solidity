type MyShieldedBool is sbool;

contract C {
    MyShieldedBool x;
    function f() external {
        assembly {
            sstore(x.slot, 1)
        }
    }
}
// ----
// TypeError 10308: (125-142): Cannot use sstore() on shielded storage variable. Use cstore() instead.
