// Constructor initialization of mixed struct with various patterns
contract C {
    struct Config {
        uint16 version;
        suint256 key;
        bool enabled;
        suint128 threshold;
        uint32 timeout;
    }

    Config private cfg;

    constructor() {
        cfg.version = 3;
        cfg.key = suint256(0xdeadbeef);
        cfg.enabled = true;
        cfg.threshold = suint128(1000000);
        cfg.timeout = 3600;
    }

    function getAll() public returns (
        uint16 version, uint256 key, bool enabled,
        uint128 threshold, uint32 timeout
    ) {
        version = cfg.version;
        key = uint256(cfg.key);
        enabled = cfg.enabled;
        threshold = uint128(cfg.threshold);
        timeout = cfg.timeout;
    }

    function updateShielded(uint256 newKey, uint128 newThreshold) public {
        cfg.key = suint256(newKey);
        cfg.threshold = suint128(newThreshold);
    }

    function updatePublic(uint16 newVersion, uint32 newTimeout) public {
        cfg.version = newVersion;
        cfg.timeout = newTimeout;
    }

    function verify() public returns (bool) {
        return cfg.version == 3 &&
               uint256(cfg.key) == 0xdeadbeef &&
               cfg.enabled == true &&
               uint128(cfg.threshold) == 1000000 &&
               cfg.timeout == 3600;
    }
}
// ----
// verify() -> true
// getAll() -> 3, 0xdeadbeef, true, 1000000, 3600
// updateShielded(uint256,uint128): 0xcafe, 5000 ->
// getAll() -> 3, 0xcafe, true, 5000, 3600
// updatePublic(uint16,uint32): 4, 7200 ->
// getAll() -> 4, 0xcafe, true, 5000, 7200
