// Verify ternary operator with saddress operands
contract C {
    saddress private stored;

    function testTernaryTrue() public pure returns (bool) {
        saddress a = saddress(address(0x1111111111111111111111111111111111111111));
        saddress b = saddress(address(0x2222222222222222222222222222222222222222));
        saddress result = true ? a : b;
        require(address(result) == address(0x1111111111111111111111111111111111111111));

        return true;
    }

    function testTernaryFalse() public pure returns (bool) {
        saddress a = saddress(address(0x1111111111111111111111111111111111111111));
        saddress b = saddress(address(0x2222222222222222222222222222222222222222));
        saddress result = false ? a : b;
        require(address(result) == address(0x2222222222222222222222222222222222222222));

        return true;
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

    function testTernaryStorage() public returns (bool) {
        saddress a = saddress(address(0x3333333333333333333333333333333333333333));
        saddress b = saddress(address(0x4444444444444444444444444444444444444444));

        stored = true ? a : b;
        require(address(stored) == address(0x3333333333333333333333333333333333333333));

        stored = false ? a : b;
        require(address(stored) == address(0x4444444444444444444444444444444444444444));

        return true;
    }
}
// ----
// testTernaryTrue() -> true
// testTernaryFalse() -> true
// testTernaryWithComparison() -> true
// testTernaryStorage() -> true
