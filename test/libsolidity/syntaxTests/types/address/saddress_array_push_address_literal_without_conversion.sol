contract C {
    saddress[] sa;

    function pushAddressLiteral() external {
        // Should require explicit conversion
        sa.push(address(0x456));
    }
}
// ----
// TypeError 4254: (144-159): Cannot push a non-shielded type to a shielded array
