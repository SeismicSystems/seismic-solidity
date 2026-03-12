contract C {
    suint256 private x;

    function test() internal {
        // One more than max uint256 - should fail
        x = 115792089237316195423570985008687907853269984665640564039457584007913129639936s;
    }
}
// ----
// Warning 9667: (132-211): Shielded number literals will leak during contract deployment.
// TypeError 7407: (132-211): Type shielded_int_const 1157...(70 digits omitted)...9936 is not implicitly convertible to expected type suint256. Literal is too large to fit in suint256.
