contract C {
    struct Record {
        sbytes payload;
        uint256 timestamp;
    }

    Record record;

    function testSet() internal {
        record.payload.push(sbytes1(0x42));
        record.timestamp = block.timestamp;
    }
}
// ----
// Warning 9663: (173-186): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
