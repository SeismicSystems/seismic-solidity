// Verify structs containing sbytes fields in storage
contract C {
    struct Mixed {
        sbytes1 sb1;
        uint256 num;
        sbytes8 sb8;
        sbytes32 sb32;
    }

    struct OnlySbytes {
        sbytes4 a;
        sbytes16 b;
        sbytes32 c;
    }

    struct Nested {
        OnlySbytes inner;
        sbytes4 extra;
    }

    Mixed private mixedVar;
    OnlySbytes private onlyVar;
    Nested private nestedVar;
    OnlySbytes[2] private structArr;

    function testMixedStruct() public returns (bool) {
        mixedVar.sb1 = sbytes1(bytes1(0xAB));
        mixedVar.num = 42;
        mixedVar.sb8 = sbytes8(bytes8(0x0102030405060708));
        mixedVar.sb32 = sbytes32(bytes32(0xDEADBEEF00000000000000000000000000000000000000000000000000000000));

        require(bytes1(mixedVar.sb1) == bytes1(0xAB));
        require(mixedVar.num == 42);
        require(bytes8(mixedVar.sb8) == bytes8(0x0102030405060708));
        require(bytes32(mixedVar.sb32) == bytes32(0xDEADBEEF00000000000000000000000000000000000000000000000000000000));

        return true;
    }

    function testOnlySbytesStruct() public returns (bool) {
        onlyVar.a = sbytes4(bytes4(0xAAAAAAAA));
        onlyVar.b = sbytes16(bytes16(0xBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB));
        onlyVar.c = sbytes32(bytes32(0xCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC));

        require(bytes4(onlyVar.a) == bytes4(0xAAAAAAAA));
        require(bytes16(onlyVar.b) == bytes16(0xBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB));
        require(bytes32(onlyVar.c) == bytes32(0xCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC));

        return true;
    }

    function testStructOverwrite() public returns (bool) {
        onlyVar.a = sbytes4(bytes4(0x11111111));
        require(bytes4(onlyVar.a) == bytes4(0x11111111));

        onlyVar.a = sbytes4(bytes4(0x22222222));
        require(bytes4(onlyVar.a) == bytes4(0x22222222));
        // Other fields should maintain their values from testOnlySbytesStruct if called in sequence,
        // but let's set fresh values to be safe
        onlyVar.b = sbytes16(bytes16(0x33333333333333333333333333333333));
        require(bytes16(onlyVar.b) == bytes16(0x33333333333333333333333333333333));

        return true;
    }

    function testNestedStruct() public returns (bool) {
        nestedVar.inner.a = sbytes4(bytes4(0xAAAAAAAA));
        nestedVar.inner.b = sbytes16(bytes16(0xBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB));
        nestedVar.inner.c = sbytes32(bytes32(0xCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC));
        nestedVar.extra = sbytes4(bytes4(0xDDDDDDDD));

        require(bytes4(nestedVar.inner.a) == bytes4(0xAAAAAAAA));
        require(bytes16(nestedVar.inner.b) == bytes16(0xBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB));
        require(bytes32(nestedVar.inner.c) == bytes32(0xCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC));
        require(bytes4(nestedVar.extra) == bytes4(0xDDDDDDDD));

        return true;
    }

    function testArrayOfStructs() public returns (bool) {
        structArr[0].a = sbytes4(bytes4(0x11111111));
        structArr[0].b = sbytes16(bytes16(0x22222222222222222222222222222222));
        structArr[0].c = sbytes32(bytes32(0x3333333333333333333333333333333333333333333333333333333333333333));

        structArr[1].a = sbytes4(bytes4(0x44444444));
        structArr[1].b = sbytes16(bytes16(0x55555555555555555555555555555555));
        structArr[1].c = sbytes32(bytes32(0x6666666666666666666666666666666666666666666666666666666666666666));

        require(bytes4(structArr[0].a) == bytes4(0x11111111));
        require(bytes16(structArr[0].b) == bytes16(0x22222222222222222222222222222222));
        require(bytes32(structArr[0].c) == bytes32(0x3333333333333333333333333333333333333333333333333333333333333333));

        require(bytes4(structArr[1].a) == bytes4(0x44444444));
        require(bytes16(structArr[1].b) == bytes16(0x55555555555555555555555555555555));
        require(bytes32(structArr[1].c) == bytes32(0x6666666666666666666666666666666666666666666666666666666666666666));

        return true;
    }
}
// ----
// testMixedStruct() -> true
// testOnlySbytesStruct() -> true
// testStructOverwrite() -> true
// testNestedStruct() -> true
// testArrayOfStructs() -> true
