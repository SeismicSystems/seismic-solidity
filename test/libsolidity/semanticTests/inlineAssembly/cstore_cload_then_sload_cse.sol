contract C {
    function test() external returns (uint256) {
        assembly {
            cstore(0, 0x1337)
            let a := cload(0)
            let b := sload(0)
            mstore(0, add(a, b))
            return(0, 0x20)
        }
    }
}
// ----
// test() -> FAILURE
