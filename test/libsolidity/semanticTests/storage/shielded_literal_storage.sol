contract LiteralStorageTest {
    suint256 singleLiteral;
    suint256 largeLiteral;
    suint256[] arrayOfLiterals;

    function storeSmallLiteral() public {
        singleLiteral = 42; // Example of a small integer literal
    }

    function storeLargeLiteral() public {
        largeLiteral = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    }

    function storeArrayOfLiterals() public {
        arrayOfLiterals.push(1);
        arrayOfLiterals.push(123456);
        arrayOfLiterals.push(789012);
    }

    function getSingleLiteral() public view returns (suint256) {
        return singleLiteral;
    }

    function getLargeLiteral() public view returns (suint256) {
        return largeLiteral;
    }

    function getLiteralFromArray() public view returns (suint256[] memory) {
        return arrayOfLiterals;
    }
}
// ----
// storeSmallLiteral()
// getSingleLiteral() -> 42
// storeLargeLiteral()
// getLargeLiteral() -> 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
// storeArrayOfLiterals()
// getLiteralFromArray() -> 0x20, 3, 1, 123456, 789012
