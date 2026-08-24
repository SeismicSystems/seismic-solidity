// Verify ternary operator with sbytes operands
contract C {
    sbytes4 private stored;

    function testTernaryTrue() public pure returns (bool) {
        sbytes4 a = sbytes4(bytes4(0x01020304));
        sbytes4 b = sbytes4(bytes4(0x05060708));
        sbytes4 result = true ? a : b;
        require(bytes4(result) == bytes4(0x01020304));

        return true;
    }

    function testTernaryFalse() public pure returns (bool) {
        sbytes4 a = sbytes4(bytes4(0x01020304));
        sbytes4 b = sbytes4(bytes4(0x05060708));
        sbytes4 result = false ? a : b;
        require(bytes4(result) == bytes4(0x05060708));

        return true;
    }

    function testTernaryWithComparison() public pure returns (bool) {
        // sbytes comparison produces sbool, convert to bool for ternary condition
        sbytes1 x = sbytes1(bytes1(0x01));
        sbytes1 y = sbytes1(bytes1(0x02));
        sbytes1 result = bool(x < y) ? sbytes1(bytes1(0xAA)) : sbytes1(bytes1(0xBB));
        require(bytes1(result) == bytes1(0xAA));

        sbytes1 result2 = bool(x > y) ? sbytes1(bytes1(0xAA)) : sbytes1(bytes1(0xBB));
        require(bytes1(result2) == bytes1(0xBB));

        return true;
    }

    function testTernaryStorage() public returns (bool) {
        sbytes4 a = sbytes4(bytes4(0xDEADBEEF));
        sbytes4 b = sbytes4(bytes4(0xCAFEBABE));

        stored = true ? a : b;
        require(bytes4(stored) == bytes4(0xDEADBEEF));

        stored = false ? a : b;
        require(bytes4(stored) == bytes4(0xCAFEBABE));

        return true;
    }

    function testTernaryDifferentSizes() public pure returns (bool) {
        sbytes1 a1 = sbytes1(bytes1(0xAA));
        sbytes1 b1 = sbytes1(bytes1(0xBB));
        require(bytes1(true ? a1 : b1) == bytes1(0xAA));

        sbytes32 a32 = sbytes32(bytes32(0xDEADBEEF00000000000000000000000000000000000000000000000000000000));
        sbytes32 b32 = sbytes32(bytes32(0xCAFEBABE00000000000000000000000000000000000000000000000000000000));
        require(bytes32(true ? a32 : b32) == bytes32(0xDEADBEEF00000000000000000000000000000000000000000000000000000000));

        return true;
    }
}
// ----
// testTernaryTrue() -> true
// testTernaryFalse() -> true
// testTernaryWithComparison() -> true
// testTernaryStorage() -> true
// testTernaryDifferentSizes() -> true
