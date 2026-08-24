contract test {
    function f() pure internal returns(sint256) {
        suint8 x = suint8(2);
        sint256 result = -1 << x;  // Should work: negative rational << shielded -> sint256
        return result;
    }
}
// ----
// Warning 10403: (85-94): Literals converted to shielded integers will leak during contract deployment.
