contract test {
    function f() pure internal returns(suint256) {
        suint8 x = suint8(100);
        suint256 result = 1 << x;  // Should work: rational << shielded -> shielded
        return result;
    }
}
// ----
// Warning 9660: (75-97): Literals converted to shielded integers will leak during contract deployment.
