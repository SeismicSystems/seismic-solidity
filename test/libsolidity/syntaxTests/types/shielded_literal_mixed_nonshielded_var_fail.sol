// Test: shielded literal mixed with non-shielded variable should fail
contract C {
    uint256 public x;

    function test() internal {
        x = 10;
        // Non-shielded var + shielded literal should fail
        x = x + 1s;
        x = x * 2s;
    }
}
// ----
// Warning 9667: (229-231): Shielded number literals will leak during contract deployment.
// TypeError 2271: (225-231): Built-in binary operator + cannot be applied to types uint256 and shielded_int_const 1.
// Warning 9667: (249-251): Shielded number literals will leak during contract deployment.
// TypeError 2271: (245-251): Built-in binary operator * cannot be applied to types uint256 and shielded_int_const 2.
