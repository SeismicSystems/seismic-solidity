// Adapted from: https://github.com/argotorg/solidity/blob/develop/test/libsolidity/semanticTests/expressions/exp_operator_const_signed.sol
contract test {
    function f() public pure returns (int256 d) {
        sint256 x = sint256(-2);
        d = int256(x ** 3);
    }
}
// ----
// f() -> -8
