// Adapted from: https://github.com/argotorg/solidity/blob/develop/test/libsolidity/semanticTests/various/positive_integers_to_signed.sol
contract test {
    function run() public pure returns (int256 d) {
        sint32 a = sint32(int32(100));
        sint64 b = sint64(int64(100));
        d = int256(int32(a)) + int256(int64(b));
    }
}
// ----
// run() -> 200
