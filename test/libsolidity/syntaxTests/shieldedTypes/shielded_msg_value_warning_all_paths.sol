contract C {
    suint256 secret;
    suint256 a;

    function viaCompound() external payable {
        secret += suint256(msg.value);
    }
    function viaTuple() external payable {
        (secret, a) = (suint256(msg.value), a);
    }
    function viaReturn() internal returns (suint256) {
        return suint256(msg.value);
    }
    function sink(suint256 x) internal {}
    function viaArg() external payable {
        sink(suint256(msg.value));
    }
}
// ----
// Warning 10306: (124-133): msg.value is always publicly visible on-chain. Assigning it to a shielded type does not hide the transaction value from observers.
// Warning 10306: (217-226): msg.value is always publicly visible on-chain. Assigning it to a shielded type does not hide the transaction value from observers.
// Warning 10306: (318-327): msg.value is always publicly visible on-chain. Assigning it to a shielded type does not hide the transaction value from observers.
// Warning 10306: (441-450): msg.value is always publicly visible on-chain. Assigning it to a shielded type does not hide the transaction value from observers.
