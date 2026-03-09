// Constructor with mix of shielded and non-shielded params — only shielded should warn
contract C {
    suint256 private sVal;
    uint256 public uVal;
    constructor(suint256 _s, uint256 _u) {
        sVal = _s;
        uVal = _u;
    }
}
// ----
// Warning 5500: (171-182): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead.
