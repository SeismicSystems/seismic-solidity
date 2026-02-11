contract C {
    saddress[] sa;

    function pushAddressLiteral() external {
        // Should require explicit conversion
        sa.push(address(0x456));
    }
}
// ----
// Warning 9665: (17-30): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 4254: (132-139): Cannot push a non-shielded type to a shielded array
