contract TestMsgValueShielded {
    function f() public payable {
        suint256 x = suint256(msg.value);
    }
}
// ----
// Warning 10306: (96-105): msg.value is always publicly visible on-chain. Assigning it to a shielded type does not hide the transaction value from observers.
// Warning 2072: (74-84): Unused local variable.
