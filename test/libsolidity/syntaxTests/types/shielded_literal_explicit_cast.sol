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
// Warning 10416: (160-163): Shielded number literals will leak during contract deployment.
// Warning 10403: (153-164): Literals converted to shielded integers will leak during contract deployment.
// Warning 10416: (224-227): Shielded number literals will leak during contract deployment.
// Warning 10403: (215-228): Literals converted to shielded integers will leak during contract deployment.
// Warning 10416: (339-342): Shielded number literals will leak during contract deployment.
// TypeError 9640: (331-343): Explicit type conversion not allowed from "shielded_int_const 42" to "uint256".
