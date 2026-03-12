contract C {
    suint256 private x;

    function test() internal {
        // Mixed shielded/non-shielded arithmetic is forbidden
        x = 1s + 1;
        x = 2 + 3s;
        x = 1s * 2;
    }
}
// ----
// Warning 9667: (144-146): Shielded number literals will leak during contract deployment.
// TypeError 2271: (144-150): Built-in binary operator + cannot be applied to types shielded_int_const 1 and int_const 1.
// Warning 9667: (168-170): Shielded number literals will leak during contract deployment.
// TypeError 2271: (164-170): Built-in binary operator + cannot be applied to types int_const 2 and shielded_int_const 3.
// TypeError 7407: (164-170): Type int_const 2 is not implicitly convertible to expected type suint256.
// Warning 9667: (184-186): Shielded number literals will leak during contract deployment.
// TypeError 2271: (184-190): Built-in binary operator * cannot be applied to types shielded_int_const 1 and int_const 2.
