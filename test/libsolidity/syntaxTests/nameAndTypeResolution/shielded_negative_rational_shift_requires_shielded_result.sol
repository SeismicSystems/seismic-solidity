contract test {
    function f() pure internal returns(sint256) {
        suint8 x = suint8(2);
        sint256 result = -1 << x;  // Should work: negative rational << shielded -> sint256
        return result;
    }
}
// ----
// Warning 9660: (85-94): Literals converted to shielded integers will leak during contract deployment.
// TypeError 9574: (104-128): Type int256 is not implicitly convertible to expected type sint256.
