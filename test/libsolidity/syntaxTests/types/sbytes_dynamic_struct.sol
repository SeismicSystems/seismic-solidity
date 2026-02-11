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
