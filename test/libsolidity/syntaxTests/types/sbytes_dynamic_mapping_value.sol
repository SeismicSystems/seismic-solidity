contract C {
    mapping(uint256 => sbytes) private data;

    function store(uint256 key) internal {
        data[key].push(sbytes1(0x01));
    }
}
// ----
