// Tests that popping all elements from a long sbytes zeros data slots
contract C {
    sbytes data;

    function test() public returns (bool) {
        // Push 40 elements (long format)
        for (uint256 i = 0; i < 40; i++)
            data.push(sbytes1(uint8(i + 1)));

        // Pop all
        uint256 len = uint256(suint256(data.length));
        for (uint256 i = 0; i < len; i++)
            data.pop();

        // Verify header zeroed
        uint256 headerVal;
        assembly { headerVal := cload(data.slot) }
        require(headerVal == 0);

        // Verify data slots zeroed via cload
        assembly {
            mstore(0, data.slot)
            let dataArea := keccak256(0, 0x20)
            if iszero(eq(cload(dataArea), 0)) { revert(0, 0) }
            if iszero(eq(cload(add(dataArea, 1)), 0)) { revert(0, 0) }
        }
        return true;
    }
}
// ----
// test() -> true
