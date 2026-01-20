contract C {
    saddress[] sa;

    function pushAddress() external {
        address addr = address(0x123);
        // Should require explicit conversion
        sa.push(addr);
    }

    function pushAddressLiteral() external {
        // Should also require explicit conversion
        sa.push(address(0x456));
    }
}
// ----
// TypeError 9574: (164-168): Invalid type for argument in function call. Invalid implicit conversion from address to saddress requested.
// TypeError 9574: (276-291): Invalid type for argument in function call. Invalid implicit conversion from address to saddress requested.
