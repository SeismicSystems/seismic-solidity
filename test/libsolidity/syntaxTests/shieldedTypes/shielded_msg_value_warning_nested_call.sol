contract C {
    suint256 s;
    suint256 a;

    function f(suint256 x) internal pure returns (suint256) { return x; }

    // msg.value nested in a real call into a shielded target must warn exactly once
    // (the argument check owns it), not twice.
    function nestedAssign() external payable {
        s = f(suint256(msg.value));
    }
    function nestedReturn() internal returns (suint256) {
        return f(suint256(msg.value));
    }
    function nestedTuple() external payable {
        (s, a) = (f(suint256(msg.value)), a);
    }
}
// ----
// Warning 10306: (324-333): msg.value is always publicly visible on-chain. Assigning it to a shielded type does not hide the transaction value from observers.
// Warning 10306: (427-436): msg.value is always publicly visible on-chain. Assigning it to a shielded type does not hide the transaction value from observers.
// Warning 10306: (521-530): msg.value is always publicly visible on-chain. Assigning it to a shielded type does not hide the transaction value from observers.
