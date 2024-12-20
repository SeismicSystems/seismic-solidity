contract LiteralStorageTest {
    suint256 singleLiteral;
    suint256 largeLiteral;
    suint256[] arrayOfLiterals;

    function storeSmallLiteral() public {
        singleLiteral = suint(42); // Example of a small integer literal
    }

    function storeLargeLiteral() public {
        largeLiteral = suint(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
    }

    function storeArrayOfLiterals() public {
        arrayOfLiterals.push(suint(1));
        arrayOfLiterals.push(suint(123456));
        arrayOfLiterals.push(suint(789012));
    }

    function getSingleLiteral() public view returns (uint256) {
        return uint(singleLiteral);
    }

    function getLargeLiteral() public view returns (uint256) {
        return uint(largeLiteral);
    }

    function getLiteralFromArray() public view returns (uint256[] memory) {
        uint256[] memory uintArray = new uint256[](uint(arrayOfLiterals.length));

        for (uint256 i = 0; i < uint(arrayOfLiterals.length); i++) {
            uintArray[i] = uint256(arrayOfLiterals[suint(i)]);
        }

        return uintArray;
    }
}
// ----
// storeSmallLiteral()
// getSingleLiteral() -> 42
// storeLargeLiteral()
// getLargeLiteral() -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// storeArrayOfLiterals()
// getLiteralFromArray() -> 0x20, 3, 1, 123456, 789012
