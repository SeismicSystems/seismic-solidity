contract C {
    // Returning shielded literal from public function requires cast to unshielded
    function f() public pure returns (uint256) {
        return uint256(42s);
    }

    // Direct return of shielded literal from public function should fail
    function g() public pure returns (uint256) {
        return 42s;
    }
}
// ----
// Warning 9660: (168-171): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 9640: (160-172): Explicit type conversion not allowed from "shielded_int_const 42" to "uint256".
// Warning 9660: (319-322): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 6359: (319-322): Return argument type shielded_int_const 42 is not implicitly convertible to expected type (type of first return variable) uint256. Shielded number literal cannot be implicitly converted to non-shielded type.
