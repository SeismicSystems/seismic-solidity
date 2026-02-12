contract TestDynamicShieldedArrayWarning {
    suint256[] arr;

    function f() public {
        arr.push(suint256(1));
    }
}
// ----
// Warning 9665: (47-61): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 9660: (107-118): Literals converted to shielded integers will leak during contract deployment.
