contract C {
    function f(suint y) public pure {
        // fits FixedBytes with exactly 32-bytes
        y = 0xffffffff00000000ffffffff00000000ffffffff00000000ffffffff00000000; // FixedBytes (32)

        // fits exactly sinto FixedBytes (32), ensures underscored literals won't hurt
        y = 0xffffffff00000000ffffffff00000000ffffffff00000000ffffffff_00000000;
    }
}
// ----
