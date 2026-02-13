contract C {
    sbytes data;

    function testAbiEncode() internal view {
        abi.encode(data);
    }

    function testAbiEncodePacked() internal view {
        abi.encodePacked(data);
    }
}
// ----
// TypeError 3648: (95-99): Shielded types cannot be ABI encoded.
// TypeError 3648: (185-189): Shielded types cannot be ABI encoded.
