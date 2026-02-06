contract C {
    function test() internal pure {
        // Test explicit conversion from string literal to sbytes
        sbytes1 sb1 = sbytes1("a");
        sbytes4 sb4 = sbytes4("abcd");
        sbytes8 sb8 = sbytes8("abcdefgh");
        sbytes16 sb16 = sbytes16("abcdefghijklmnop");
        sbytes32 sb32 = sbytes32("abcdefghijklmnopqrstuvwxyz012345");

        // Test explicit conversion from hex literal to sbytes
        sbytes4 sb4_hex = sbytes4(hex"61626364");
        sbytes8 sb8_hex = sbytes8(hex"6162636465666768");

        // Test with shorter string (left-aligned, zero-padded)
        sbytes4 sb4_short = sbytes4("ab");
        sbytes8 sb8_short = sbytes8("ab");
    }
}
// ----
// Warning 2072: (123-134): Unused local variable.
// Warning 2072: (159-170): Unused local variable.
// Warning 2072: (198-209): Unused local variable.
// Warning 2072: (241-254): Unused local variable.
// Warning 2072: (295-308): Unused local variable.
// Warning 2072: (429-444): Unused local variable.
// Warning 2072: (479-494): Unused local variable.
// Warning 2072: (602-619): Unused local variable.
// Warning 2072: (645-662): Unused local variable.
