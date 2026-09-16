// Constructor with suint256 param — should warn (CREATE doesn't encrypt calldata)
contract C {
    suint256 private val;
    constructor(suint256 _val) {
        val = _val;
    }
}
// ----
// Warning 10103: (140-153): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
