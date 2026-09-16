contract C {
    struct S { suint256 priv; }
    S s;
    suint256[3] arr;
    function tupleStructMember() external payable {
        uint256 dummy;
        (s.priv, dummy) = (suint256(msg.value), 0);
    }
    function tupleArrayIndex() external payable {
        uint256 dummy;
        (arr[0], dummy) = (suint256(msg.value), 0);
    }
    function tupleIdentifierLHS() external payable {
        suint256 localSecret;
        uint256 dummy;
        (localSecret, dummy) = (suint256(msg.value), 0);
    }
}
// ----
// Warning 10306: (186-195): msg.value is always publicly visible on-chain. Assigning it to a shielded type does not hide the transaction value from observers.
// Warning 10306: (317-326): msg.value is always publicly visible on-chain. Assigning it to a shielded type does not hide the transaction value from observers.
// Warning 10306: (486-495): msg.value is always publicly visible on-chain. Assigning it to a shielded type does not hide the transaction value from observers.
