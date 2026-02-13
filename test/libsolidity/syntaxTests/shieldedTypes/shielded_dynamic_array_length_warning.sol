contract TestDynamicShieldedArrayWarning {
    suint256[] arr;

    function f() public {
        arr.push(suint256(1));
    }
}
// ----
// Warning 9660: (107-118): Literals converted to shielded integers will leak during contract deployment.
