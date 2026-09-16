// Constructor with only non-shielded params — no warning
contract C {
    uint256 public val;
    constructor(uint256 _val) {
        val = _val;
    }
}
// ----
