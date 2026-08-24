contract C {
    function test() internal {
        // Explicit cast of shielded literal to unshielded type
        uint256 a = uint256(42s);
        uint8 b = uint8(255s);
        int256 c = int256(-42s);
        int8 d = int8(-128s);
    }
}
// ----
// Warning 10416: (136-139): Shielded number literals will leak during contract deployment.
// TypeError 9640: (128-140): Explicit type conversion not allowed from "shielded_int_const 42" to "uint256".
// Warning 10416: (166-170): Shielded number literals will leak during contract deployment.
// TypeError 9640: (160-171): Explicit type conversion not allowed from "shielded_int_const 255" to "uint8".
// Warning 10416: (200-203): Shielded number literals will leak during contract deployment.
// TypeError 9640: (192-204): Explicit type conversion not allowed from "shielded_int_const -42" to "int256".
// Warning 10416: (229-233): Shielded number literals will leak during contract deployment.
// TypeError 9640: (223-234): Explicit type conversion not allowed from "shielded_int_const -128" to "int8".
