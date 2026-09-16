contract C {
    suint256 private secret;
    function store() external payable {
        secret = suint256(msg.value);
    }
}
// ----
// Warning 10306: (108-117): msg.value is always publicly visible on-chain. Assigning it to a shielded type does not hide the transaction value from observers.
