type MyShieldedUint is suint256;

contract C {
    MyShieldedUint x;
    function f() external view returns (uint256 result) {
        assembly {
            result := sload(x.slot)
        }
    }
}
// ----
// TypeError 10308: (168-181): Cannot use sload() on shielded storage variable. Use cload() instead.
