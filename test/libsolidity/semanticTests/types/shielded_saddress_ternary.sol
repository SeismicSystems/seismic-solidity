// Verify ternary operator with saddress operands
contract C {
    saddress private stored;

    function testTernary(bool cond) public pure returns (address) {
        saddress a = saddress(address(0x1111111111111111111111111111111111111111));
        saddress b = saddress(address(0x2222222222222222222222222222222222222222));
        saddress result = cond ? a : b;
        return address(result);
    }

    function testTernaryWithComparison() public pure returns (bool) {
        // saddress comparison produces sbool, convert to bool for ternary condition
        saddress x = saddress(address(0x1111111111111111111111111111111111111111));
        saddress y = saddress(address(0x2222222222222222222222222222222222222222));
        saddress aa = saddress(address(0xaAaAaAaaAaAaAaaAaAAAAAAAAaaaAaAaAaaAaaAa));
        saddress bb = saddress(address(0xbBbBBBBbbBBBbbbBbbBbbbbBBbBbbbbBbBbbBBbB));

        saddress result = bool(x == y) ? aa : bb;
        require(address(result) == address(0xbBbBBBBbbBBBbbbBbbBbbbbBBbBbbbbBbBbbBBbB));

        saddress result2 = bool(x != y) ? aa : bb;
        require(address(result2) == address(0xaAaAaAaaAaAaAaaAaAAAAAAAAaaaAaAaAaaAaaAa));

        return true;
    }

    function testTernaryStorage(bool cond) public returns (address) {
        saddress a = saddress(address(0x3333333333333333333333333333333333333333));
        saddress b = saddress(address(0x4444444444444444444444444444444444444444));

        stored = cond ? a : b;
        return address(stored);
    }
}
// ----
// testTernary(bool): true -> 0x1111111111111111111111111111111111111111
// testTernary(bool): false -> 0x2222222222222222222222222222222222222222
// testTernaryWithComparison() -> true
// testTernaryStorage(bool): true -> 0x3333333333333333333333333333333333333333
// testTernaryStorage(bool): false -> 0x4444444444444444444444444444444444444444
