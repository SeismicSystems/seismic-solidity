// Tests sbytes to sbytesN explicit conversion compiles
// Adapted from array/bytes_to_fixed_bytes.sol
contract C {
    sbytes s;
    function f() internal view {
        sbytes3 a = sbytes3(s);
        sbytes8 b = sbytes8(s);
        sbytes16 c = sbytes16(s);
        sbytes32 d = sbytes32(s);
    }
}
// ----
// Warning 2072: (171-180): Unused local variable.
// Warning 2072: (203-212): Unused local variable.
// Warning 2072: (235-245): Unused local variable.
// Warning 2072: (269-279): Unused local variable.
