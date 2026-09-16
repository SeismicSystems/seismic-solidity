contract C {
    function test(uint256 x) external returns (uint256 r) {
        assembly {
            switch x
            case 0 { cstore(0, 42) }
            default { r := sload(0) }
        }
    }
}
// ----
