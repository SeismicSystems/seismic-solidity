contract C {
    saddress[] sa;

    function pushAddress() external {
        address addr = address(0x123);
        // Should require explicit conversion
        sa.push(addr);
    }
}
// ----
// Warning 9665: (17-30): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 10205: (164-171): Cannot push a non-shielded type to a shielded array
