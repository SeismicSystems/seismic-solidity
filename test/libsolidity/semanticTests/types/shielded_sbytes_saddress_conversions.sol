// Verify sbytes20 <-> saddress explicit conversions
contract C {
    saddress private storedAddr;
    sbytes20 private storedSb;

    function testSbytes20ToSaddress() public pure returns (bool) {
        sbytes20 sb = sbytes20(bytes20(0x1234567890AbcdEF1234567890aBcdef12345678));
        saddress sa = saddress(sb);
        require(address(sa) == address(0x1234567890AbcdEF1234567890aBcdef12345678));

        return true;
    }

    function testSaddressToSbytes20() public pure returns (bool) {
        saddress sa = saddress(address(0xdead000000000000000000000000000000000001));
        sbytes20 sb = sbytes20(sa);
        require(bytes20(sb) == bytes20(address(0xdead000000000000000000000000000000000001)));

        return true;
    }

    function testRoundTrip() public pure returns (bool) {
        // saddress -> sbytes20 -> saddress
        saddress origAddr = saddress(address(0xcaFe000000000000000000000000000000000042));
        sbytes20 mid = sbytes20(origAddr);
        saddress back = saddress(mid);
        require(address(back) == address(0xcaFe000000000000000000000000000000000042));

        // sbytes20 -> saddress -> sbytes20
        sbytes20 origSb = sbytes20(bytes20(0xaBCdEf0000000000000000000000000000000001));
        saddress midAddr = saddress(origSb);
        sbytes20 backSb = sbytes20(midAddr);
        require(bytes20(backSb) == bytes20(0xaBCdEf0000000000000000000000000000000001));

        return true;
    }

    function testKnownAddresses() public pure returns (bool) {
        // address(1)
        saddress one = saddress(address(1));
        sbytes20 sb1 = sbytes20(one);
        require(bytes20(sb1) == bytes20(address(1)));

        // Zero address
        saddress zero = saddress(address(0));
        sbytes20 sb0 = sbytes20(zero);
        require(bytes20(sb0) == bytes20(address(0)));

        // All-FF address
        saddress maxAddr = saddress(address(0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF));
        sbytes20 sbMax = sbytes20(maxAddr);
        require(bytes20(sbMax) == bytes20(address(0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF)));

        return true;
    }

    function testWithStorage() public returns (bool) {
        storedAddr = saddress(address(0xDead000000000000000000000000000000000042));
        sbytes20 sb = sbytes20(storedAddr);
        require(bytes20(sb) == bytes20(address(0xDead000000000000000000000000000000000042)));

        storedSb = sbytes20(bytes20(0xcafE000000000000000000000000000000000001));
        saddress sa = saddress(storedSb);
        require(address(sa) == address(0xcafE000000000000000000000000000000000001));

        return true;
    }
}
// ----
// testSbytes20ToSaddress() -> true
// testSaddressToSbytes20() -> true
// testRoundTrip() -> true
// testKnownAddresses() -> true
// testWithStorage() -> true
