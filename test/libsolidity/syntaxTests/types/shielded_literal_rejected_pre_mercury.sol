contract C {
    function f() public pure returns (uint256) {
        return 42s;
    }
}
// ====
// EVMVersion: =cancun
// ----
// ParserError 8936: (77-79): Identifier-start is not allowed at end of a number.
