contract C {
    function div(suint256 a, suint256 b) public returns (uint256) {
        unchecked {
            return uint256(a / b);
        }
    }
    function mod(suint256 a, suint256 b) public returns (uint256) {
        unchecked {
            return uint256(a % b);
        }
    }
}
// ----
// div(suint256,suint256): 7, 2 -> 3
// div(suint256,suint256): 7, 0 -> FAILURE, hex"4e487b71", 0x12
// mod(suint256,suint256): 7, 2 -> 1
// mod(suint256,suint256): 7, 0 -> FAILURE, hex"4e487b71", 0x12
