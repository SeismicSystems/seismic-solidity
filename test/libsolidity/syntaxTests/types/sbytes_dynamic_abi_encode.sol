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
// Warning 9665: (17-28): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 10202: (95-99): Shielded types cannot be ABI encoded.
// TypeError 10202: (185-189): Shielded types cannot be ABI encoded.
