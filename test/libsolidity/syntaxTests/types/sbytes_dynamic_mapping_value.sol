contract C {
    mapping(uint256 => sbytes) private data;

    function store(uint256 key) internal {
        data[key].push(sbytes1(0x01));
    }
}
// ----
// Warning 10412: (125-138): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
