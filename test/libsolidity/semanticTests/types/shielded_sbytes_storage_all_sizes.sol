// Verify cstore/cload roundtrip for all 32 sbytes sizes
contract C {
    sbytes1 private s1;
    sbytes2 private s2;
    sbytes3 private s3;
    sbytes4 private s4;
    sbytes5 private s5;
    sbytes6 private s6;
    sbytes7 private s7;
    sbytes8 private s8;
    sbytes9 private s9;
    sbytes10 private s10;
    sbytes11 private s11;
    sbytes12 private s12;
    sbytes13 private s13;
    sbytes14 private s14;
    sbytes15 private s15;
    sbytes16 private s16;
    sbytes17 private s17;
    sbytes18 private s18;
    sbytes19 private s19;
    sbytes20 private s20;
    sbytes21 private s21;
    sbytes22 private s22;
    sbytes23 private s23;
    sbytes24 private s24;
    sbytes25 private s25;
    sbytes26 private s26;
    sbytes27 private s27;
    sbytes28 private s28;
    sbytes29 private s29;
    sbytes30 private s30;
    sbytes31 private s31;
    sbytes32 private s32;

    function testStorageA() public returns (bool) {
        s1 = sbytes1(bytes1(0x42));
        s2 = sbytes2(bytes2(0x4243));
        s3 = sbytes3(bytes3(0x424344));
        s4 = sbytes4(bytes4(0x42434445));
        s5 = sbytes5(bytes5(0x4243444546));
        s6 = sbytes6(bytes6(0x424344454647));
        s7 = sbytes7(bytes7(0x42434445464748));
        s8 = sbytes8(bytes8(0x4243444546474849));

        require(bytes1(s1) == bytes1(0x42));
        require(bytes2(s2) == bytes2(0x4243));
        require(bytes3(s3) == bytes3(0x424344));
        require(bytes4(s4) == bytes4(0x42434445));
        require(bytes5(s5) == bytes5(0x4243444546));
        require(bytes6(s6) == bytes6(0x424344454647));
        require(bytes7(s7) == bytes7(0x42434445464748));
        require(bytes8(s8) == bytes8(0x4243444546474849));

        return true;
    }

    function testStorageB() public returns (bool) {
        s9 = sbytes9(bytes9(0x424344454647484950));
        s10 = sbytes10(bytes10(0x42434445464748495051));
        s11 = sbytes11(bytes11(0x4243444546474849505152));
        s12 = sbytes12(bytes12(0x424344454647484950515253));
        s13 = sbytes13(bytes13(0x42434445464748495051525354));
        s14 = sbytes14(bytes14(0x4243444546474849505152535455));
        s15 = sbytes15(bytes15(0x424344454647484950515253545556));
        s16 = sbytes16(bytes16(0x42434445464748495051525354555657));

        require(bytes9(s9) == bytes9(0x424344454647484950));
        require(bytes10(s10) == bytes10(0x42434445464748495051));
        require(bytes11(s11) == bytes11(0x4243444546474849505152));
        require(bytes12(s12) == bytes12(0x424344454647484950515253));
        require(bytes13(s13) == bytes13(0x42434445464748495051525354));
        require(bytes14(s14) == bytes14(0x4243444546474849505152535455));
        require(bytes15(s15) == bytes15(0x424344454647484950515253545556));
        require(bytes16(s16) == bytes16(0x42434445464748495051525354555657));

        return true;
    }

    function testStorageC() public returns (bool) {
        s17 = sbytes17(bytes17(0x4243444546474849505152535455565758));
        s18 = sbytes18(bytes18(0x424344454647484950515253545556575859));
        s19 = sbytes19(bytes19(0x42434445464748495051525354555657585960));
        s20 = sbytes20(bytes20(0x4243444546474849505152535455565758596061));
        s21 = sbytes21(bytes21(0x424344454647484950515253545556575859606162));
        s22 = sbytes22(bytes22(0x42434445464748495051525354555657585960616263));
        s23 = sbytes23(bytes23(0x4243444546474849505152535455565758596061626364));
        s24 = sbytes24(bytes24(0x424344454647484950515253545556575859606162636465));

        require(bytes17(s17) == bytes17(0x4243444546474849505152535455565758));
        require(bytes18(s18) == bytes18(0x424344454647484950515253545556575859));
        require(bytes19(s19) == bytes19(0x42434445464748495051525354555657585960));
        require(bytes20(s20) == bytes20(0x4243444546474849505152535455565758596061));
        require(bytes21(s21) == bytes21(0x424344454647484950515253545556575859606162));
        require(bytes22(s22) == bytes22(0x42434445464748495051525354555657585960616263));
        require(bytes23(s23) == bytes23(0x4243444546474849505152535455565758596061626364));
        require(bytes24(s24) == bytes24(0x424344454647484950515253545556575859606162636465));

        return true;
    }

    function testStorageD() public returns (bool) {
        s25 = sbytes25(bytes25(0x42434445464748495051525354555657585960616263646566));
        s26 = sbytes26(bytes26(0x4243444546474849505152535455565758596061626364656667));
        s27 = sbytes27(bytes27(0x424344454647484950515253545556575859606162636465666768));
        s28 = sbytes28(bytes28(0x42434445464748495051525354555657585960616263646566676869));
        s29 = sbytes29(bytes29(0x4243444546474849505152535455565758596061626364656667686970));
        s30 = sbytes30(bytes30(0x424344454647484950515253545556575859606162636465666768697071));
        s31 = sbytes31(bytes31(0x42434445464748495051525354555657585960616263646566676869707172));
        s32 = sbytes32(bytes32(0x4243444546474849505152535455565758596061626364656667686970717273));

        require(bytes25(s25) == bytes25(0x42434445464748495051525354555657585960616263646566));
        require(bytes26(s26) == bytes26(0x4243444546474849505152535455565758596061626364656667));
        require(bytes27(s27) == bytes27(0x424344454647484950515253545556575859606162636465666768));
        require(bytes28(s28) == bytes28(0x42434445464748495051525354555657585960616263646566676869));
        require(bytes29(s29) == bytes29(0x4243444546474849505152535455565758596061626364656667686970));
        require(bytes30(s30) == bytes30(0x424344454647484950515253545556575859606162636465666768697071));
        require(bytes31(s31) == bytes31(0x42434445464748495051525354555657585960616263646566676869707172));
        require(bytes32(s32) == bytes32(0x4243444546474849505152535455565758596061626364656667686970717273));

        return true;
    }
}
// ----
// testStorageA() -> true
// testStorageB() -> true
// testStorageC() -> true
// testStorageD() -> true
