contract C {
    function test() internal {
        // Shielded literal to uint
        uint8 a = 1s;
        // Shielded literal to int
        int8 b = -1s;
        // Shielded literal to uint256
        uint256 c = 42s;
    }
}
// ----
// Warning 9667: (98-100): Shielded number literals will leak during contract deployment.
// TypeError 9574: (88-100): Type shielded_int_const 1 is not implicitly convertible to expected type uint8. Shielded number literal cannot be implicitly converted to non-shielded type.
// Warning 9667: (155-157): Shielded number literals will leak during contract deployment.
// TypeError 9574: (145-157): Type shielded_int_const -1 is not implicitly convertible to expected type int8. Shielded number literal cannot be implicitly converted to non-shielded type.
// Warning 9667: (218-221): Shielded number literals will leak during contract deployment.
// TypeError 9574: (206-221): Type shielded_int_const 42 is not implicitly convertible to expected type uint256. Shielded number literal cannot be implicitly converted to non-shielded type.
