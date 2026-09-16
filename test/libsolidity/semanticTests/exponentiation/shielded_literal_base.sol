contract test {
    function f(suint256 x) public pure returns (uint) {
        unchecked {
            suint256 a = suint256(2) ** x;
            return uint256(a);
        }
    }
}
// ----
// f(suint256): 0 -> 1
// f(suint256): 1 -> 2
// f(suint256): 2 -> 4
// f(suint256): 13 -> 0x2000
// f(suint256): 113 -> 0x020000000000000000000000000000
// f(suint256): 114 -> 0x040000000000000000000000000000
// f(suint256): 1113 -> 0x00
// f(suint256): 1114 -> 0x00
