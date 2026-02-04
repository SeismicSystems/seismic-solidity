contract test {
    function f() pure internal returns(uint256) {
        suint8 x = suint8(100);
        uint256 result = 1 << x;  // Should fail: implicit conversion from shielded to public
        return result;
    }
}
// ----
// Warning 9660: (74-96): Literals converted to shielded integers will leak during contract deployment.
// TypeError 9574: (106-129): Type suint256 is not implicitly convertible to expected type uint256.
