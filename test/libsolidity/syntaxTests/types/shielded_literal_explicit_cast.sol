contract C {
    suint8 private a;
    suint256 private b;

    function test() internal {
        // Explicit cast to smaller shielded type
        a = suint8(42s);
        // Explicit cast to suint256
        b = suint256(42s);
        // Explicit cast of shielded literal to non-shielded (should this work?)
        uint256 c = uint256(42s);
    }
}
// ----
// Warning 9660: (160-163): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (153-164): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (224-227): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (215-228): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (339-342): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 9640: (331-343): Explicit type conversion not allowed from "shielded_int_const 42" to "uint256".
