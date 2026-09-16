// A public integer base raised to a shielded exponent must be a shielded result, so it
// cannot cross a public ABI boundary. Previously IntegerType::binaryOperatorResult dropped
// the shielded marker on the Exp branch (returned the public base type), letting the
// exponent be returned through a public function and recovered in invertible ranges.
contract C {
    suint8 private secretExponent;

    function leak(uint256 base) external view returns (uint256) {
        return base ** secretExponent;
    }
}
// ----
// Warning 10304: (482-504): Shielded integer exponentiation will leak the exponent value through gas cost.
// TypeError 6359: (482-504): Return argument type suint256 is not implicitly convertible to expected type (type of first return variable) uint256.
