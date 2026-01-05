contract TestShieldedABIEncode {
    function testEncode(suint value) public pure returns (bytes memory) {
        return abi.encode(value);
    }

    function testEncodePacked(suint value) public pure returns (bytes memory) {
        return abi.encodePacked(value);
    }

    function testEncodeWithSelector(suint value) public pure returns (bytes memory) {
        return abi.encodeWithSelector(bytes4(0x12345678), value);
    }

    function testEncodeWithSignature(suint value) public pure returns (bytes memory) {
        return abi.encodeWithSignature("transfer(uint256)", value);
    }

    function testEncodeCall(suint value) public pure returns (bytes memory) {
        return abi.encodeCall(this.someFunction, (value));
    }

    function someFunction(suint) external {}

    function testEncodeRegular(uint value) public pure returns (bytes memory) {
        return abi.encode(value);
    }
}
// ----
// TypeError 9664: (133-138): Shielded types cannot be ABI-encoded. Encoding shielded values would leak information through the resulting bytes.
// TypeError 9664: (260-265): Shielded types cannot be ABI-encoded. Encoding shielded values would leak information through the resulting bytes.
// TypeError 9664: (419-424): Shielded types cannot be ABI-encoded. Encoding shielded values would leak information through the resulting bytes.
// TypeError 9664: (581-586): Shielded types cannot be ABI-encoded. Encoding shielded values would leak information through the resulting bytes.
// TypeError 9664: (704-721): Cannot use abi.encodeCall with functions that have shielded parameter types. Encoding shielded values would leak information through the resulting bytes.
