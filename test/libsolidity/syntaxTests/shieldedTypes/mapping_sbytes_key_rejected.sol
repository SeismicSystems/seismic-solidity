// sbytes as a mapping key must be rejected (key would be hashed in plaintext for slot derivation).
contract C {
    mapping(sbytes => uint256) m;
}
// ----
// TypeError 10109: (125-131): Shielded types are not allowed as mapping keys.
