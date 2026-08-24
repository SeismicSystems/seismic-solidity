contract C {
    suint256 secret;
    function wrap(uint256 v) internal pure returns (suint256) { return suint256(v); }
    function launderThroughHelper() external payable { secret = wrap(msg.value); }
    function direct() external payable { secret = suint256(msg.value); }
    function sinkShielded(suint256 _v) internal { secret = _v; }
    function throughShieldedParam() external payable { sinkShielded(suint256(msg.value)); }
}
// ----
// Warning 10306: (189-198): msg.value is always publicly visible on-chain. Assigning it to a shielded type does not hide the transaction value from observers.
// Warning 10306: (262-271): msg.value is always publicly visible on-chain. Assigning it to a shielded type does not hide the transaction value from observers.
// Warning 10306: (418-427): msg.value is always publicly visible on-chain. Assigning it to a shielded type does not hide the transaction value from observers.
