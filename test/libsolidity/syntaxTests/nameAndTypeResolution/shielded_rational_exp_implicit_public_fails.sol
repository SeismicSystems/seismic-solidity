contract test {
    function f() pure internal returns(uint256) {
        suint8 x = suint8(2);
        uint256 result = 10 ** x;  // Should fail: implicit conversion from shielded to public
        return result;
    }
}
// ----
// Warning 9660: (74-94): Literals converted to shielded integers will leak during contract deployment.
// Warning 3817: (121-128): Shielded integer exponentiation will leak the exponent value through gas cost.
// TypeError 9574: (104-128): Type suint256 is not implicitly convertible to expected type uint256.
