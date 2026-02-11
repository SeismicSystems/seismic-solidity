contract C {
    suint256[] arr;

    function test() public {
        suint256 shieldedVar = suint256(1);
        suint256 x = arr[shieldedVar + suint256(1)];
    }
}
// ----
// Warning 9665: (17-31): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 9660: (71-105): Literals converted to shielded integers will leak during contract deployment.
// Warning 4282: (132-157): Shielded integer addition can leak information. A revert due to overflow reveals range information about the operands.
// TypeError 7407: (132-157): Type suint256 is not implicitly convertible to expected type uint256.
// TypeError 5910: (132-157): Shielded types are not allowed as array indices.
