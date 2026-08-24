// Verify bytes N -> sbytes N -> bytes N roundtrip for all 32 sizes
contract C {
    function testRoundtripA() public pure returns (bool) {
        bytes1 b1 = bytes1(0xAB);
        require(bytes1(sbytes1(b1)) == b1);

        bytes2 b2 = bytes2(0xABCD);
        require(bytes2(sbytes2(b2)) == b2);

        bytes3 b3 = bytes3(0xABCDEF);
        require(bytes3(sbytes3(b3)) == b3);

        bytes4 b4 = bytes4(0xABCDEF01);
        require(bytes4(sbytes4(b4)) == b4);

        bytes5 b5 = bytes5(0xABCDEF0102);
        require(bytes5(sbytes5(b5)) == b5);

        bytes6 b6 = bytes6(0xABCDEF010203);
        require(bytes6(sbytes6(b6)) == b6);

        bytes7 b7 = bytes7(0xABCDEF01020304);
        require(bytes7(sbytes7(b7)) == b7);

        bytes8 b8 = bytes8(0xABCDEF0102030405);
        require(bytes8(sbytes8(b8)) == b8);

        return true;
    }

    function testRoundtripB() public pure returns (bool) {
        bytes9 b9 = bytes9(0xABCDEF010203040506);
        require(bytes9(sbytes9(b9)) == b9);

        bytes10 b10 = bytes10(0xABCDEF01020304050607);
        require(bytes10(sbytes10(b10)) == b10);

        bytes11 b11 = bytes11(0xABCDEF0102030405060708);
        require(bytes11(sbytes11(b11)) == b11);

        bytes12 b12 = bytes12(0xABCDEF010203040506070809);
        require(bytes12(sbytes12(b12)) == b12);

        bytes13 b13 = bytes13(0xABCDEF01020304050607080910);
        require(bytes13(sbytes13(b13)) == b13);

        bytes14 b14 = bytes14(0xABCDEF0102030405060708091011);
        require(bytes14(sbytes14(b14)) == b14);

        bytes15 b15 = bytes15(0xABCDEF010203040506070809101112);
        require(bytes15(sbytes15(b15)) == b15);

        bytes16 b16 = bytes16(0xABCDEF01020304050607080910111213);
        require(bytes16(sbytes16(b16)) == b16);

        return true;
    }

    function testRoundtripC() public pure returns (bool) {
        bytes17 b17 = bytes17(0xABCDEF0102030405060708091011121314);
        require(bytes17(sbytes17(b17)) == b17);

        bytes18 b18 = bytes18(0xABCDEF010203040506070809101112131415);
        require(bytes18(sbytes18(b18)) == b18);

        bytes19 b19 = bytes19(0xABCDEF01020304050607080910111213141516);
        require(bytes19(sbytes19(b19)) == b19);

        bytes20 b20 = bytes20(0x0102030405060708091011121314151617181920);
        require(bytes20(sbytes20(b20)) == b20);

        bytes21 b21 = bytes21(0xABCDEF010203040506070809101112131415161718);
        require(bytes21(sbytes21(b21)) == b21);

        bytes22 b22 = bytes22(0xABCDEF01020304050607080910111213141516171819);
        require(bytes22(sbytes22(b22)) == b22);

        bytes23 b23 = bytes23(0xABCDEF0102030405060708091011121314151617181920);
        require(bytes23(sbytes23(b23)) == b23);

        bytes24 b24 = bytes24(0xABCDEF010203040506070809101112131415161718192021);
        require(bytes24(sbytes24(b24)) == b24);

        return true;
    }

    function testRoundtripD() public pure returns (bool) {
        bytes25 b25 = bytes25(0xABCDEF01020304050607080910111213141516171819202122);
        require(bytes25(sbytes25(b25)) == b25);

        bytes26 b26 = bytes26(0xABCDEF0102030405060708091011121314151617181920212223);
        require(bytes26(sbytes26(b26)) == b26);

        bytes27 b27 = bytes27(0xABCDEF010203040506070809101112131415161718192021222324);
        require(bytes27(sbytes27(b27)) == b27);

        bytes28 b28 = bytes28(0xABCDEF01020304050607080910111213141516171819202122232425);
        require(bytes28(sbytes28(b28)) == b28);

        bytes29 b29 = bytes29(0xABCDEF0102030405060708091011121314151617181920212223242526);
        require(bytes29(sbytes29(b29)) == b29);

        bytes30 b30 = bytes30(0xABCDEF010203040506070809101112131415161718192021222324252627);
        require(bytes30(sbytes30(b30)) == b30);

        bytes31 b31 = bytes31(0xABCDEF01020304050607080910111213141516171819202122232425262728);
        require(bytes31(sbytes31(b31)) == b31);

        bytes32 b32 = bytes32(0xABCDEF0102030405060708091011121314151617181920212223242526272829);
        require(bytes32(sbytes32(b32)) == b32);

        return true;
    }
}
// ----
// testRoundtripA() -> true
// testRoundtripB() -> true
// testRoundtripC() -> true
// testRoundtripD() -> true
