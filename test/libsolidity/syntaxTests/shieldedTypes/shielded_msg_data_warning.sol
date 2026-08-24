contract C {
    function f() public {
        sbytes memory x = sbytes(msg.data);
    }
}
// ----
// Warning 10307: (72-80): msg.data is publicly visible on-chain for non-seismic transactions. Assigning it to a shielded type does not hide the calldata from observers unless the call originates as a seismic transaction.
// Warning 2072: (47-62): Unused local variable.
// Warning 2018: (17-88): Function state mutability can be restricted to pure
