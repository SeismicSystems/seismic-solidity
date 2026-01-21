contract C {
    saddress[] sa;

    function pushAddress() external {
        address addr = address(0x123);
        // Should require explicit conversion
        sa.push(addr);
    }
}
// ----
// TypeError 4254: (164-171): Cannot push a non-shielded type to a shielded array
