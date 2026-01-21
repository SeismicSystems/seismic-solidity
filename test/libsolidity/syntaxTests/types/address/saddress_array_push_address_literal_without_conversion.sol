contract C {
    saddress[] sa;

    function pushAddressLiteral() external {
        // Should require explicit conversion
        sa.push(address(0x456));
    }
}
// ----
// TypeError 4254: (132-139): Cannot push a non-shielded type to a shielded array
