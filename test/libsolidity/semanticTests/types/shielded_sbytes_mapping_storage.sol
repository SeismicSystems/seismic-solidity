// Verify mappings with sbytes values (sbytes as keys is disallowed)
contract C {
    mapping(uint256 => sbytes4) private uintToSb4;
    mapping(address => sbytes32) private addrToSb32;

    function testUintToSbytes() public returns (bool) {
        uintToSb4[0] = sbytes4(bytes4(0xAAAAAAAA));
        uintToSb4[1] = sbytes4(bytes4(0xBBBBBBBB));
        uintToSb4[42] = sbytes4(bytes4(0xCCCCCCCC));

        require(bytes4(uintToSb4[0]) == bytes4(0xAAAAAAAA));
        require(bytes4(uintToSb4[1]) == bytes4(0xBBBBBBBB));
        require(bytes4(uintToSb4[42]) == bytes4(0xCCCCCCCC));

        return true;
    }

    function testAddressToSbytes() public returns (bool) {
        addrToSb32[address(1)] = sbytes32(bytes32(0xDEADBEEF00000000000000000000000000000000000000000000000000000000));
        addrToSb32[address(2)] = sbytes32(bytes32(0xCAFEBABE00000000000000000000000000000000000000000000000000000000));

        require(bytes32(addrToSb32[address(1)]) == bytes32(0xDEADBEEF00000000000000000000000000000000000000000000000000000000));
        require(bytes32(addrToSb32[address(2)]) == bytes32(0xCAFEBABE00000000000000000000000000000000000000000000000000000000));

        return true;
    }

    function testMultipleEntries() public returns (bool) {
        // Write many entries and verify no interference
        for (uint256 i = 0; i < 10; i++) {
            uintToSb4[i] = sbytes4(bytes4(uint32(i + 1)));
        }

        for (uint256 i = 0; i < 10; i++) {
            require(bytes4(uintToSb4[i]) == bytes4(uint32(i + 1)));
        }

        return true;
    }

    function testOverwriteMapping() public returns (bool) {
        uintToSb4[5] = sbytes4(bytes4(0x11111111));
        require(bytes4(uintToSb4[5]) == bytes4(0x11111111));

        uintToSb4[5] = sbytes4(bytes4(0x22222222));
        require(bytes4(uintToSb4[5]) == bytes4(0x22222222));

        return true;
    }

    function testDeleteMapping() public returns (bool) {
        uintToSb4[99] = sbytes4(bytes4(0xFFFFFFFF));
        require(bytes4(uintToSb4[99]) == bytes4(0xFFFFFFFF));

        delete uintToSb4[99];
        require(bytes4(uintToSb4[99]) == bytes4(0x00000000));

        return true;
    }

    function testUnsetKey() public returns (bool) {
        // Reading an unset key should return zero
        require(bytes4(uintToSb4[12345]) == bytes4(0x00000000));
        require(bytes32(addrToSb32[address(0)]) == bytes32(0));

        return true;
    }
}
// ----
// testUintToSbytes() -> true
// testAddressToSbytes() -> true
// testMultipleEntries() -> true
// testOverwriteMapping() -> true
// testDeleteMapping() -> true
// testUnsetKey() -> true
