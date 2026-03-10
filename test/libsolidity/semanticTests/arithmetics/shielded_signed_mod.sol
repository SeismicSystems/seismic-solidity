// Adapted from: test/libsolidity/semanticTests/arithmetics/signed_mod.sol
contract C {
    function f(sint256 a, sint256 b) public pure returns (int256) {
        return int256(a % b);
    }
    function g(bool _check) public pure returns (int256) {
        sint256 x = type(sint256).min;
        if (_check) {
            return int256(x / sint256(-1));
        } else {
            unchecked { return int256(x / sint256(-1)); }
        }
    }
}
// ----
// f(sint256,sint256): 7, 5 -> 2
// f(sint256,sint256): 7, -5 -> 2
// f(sint256,sint256): -7, 5 -> -2
// f(sint256,sint256): -7, 5 -> -2
// f(sint256,sint256): -5, -5 -> 0
// g(bool): true -> FAILURE, hex"4e487b71", 0x11
// g(bool): false -> -57896044618658097711785492504343953926634992332820282019728792003956564819968
