contract C {
    suint8 private secret;
    bytes32 private bs;
    bytes32 public pub;
    sbytes32 private stored;
    event E(bytes32 v);
    // bytesN shifted by a shielded amount yields a shielded fixed-bytes result: public sinks error
    function ret() external view returns (bytes32) { return bs << secret; }
    function store() external { pub = bs << secret; }
    function ev() external { emit E(bs << secret); }
    // shielded fixed-bytes sink is fine
    function shieldedOk() external { stored = bs << secret; }
    // public shift amount is unaffected
    function publicOk(uint8 n) external view returns (bytes32) { return bs << n; }
}
// ----
// TypeError 6359: (301-313): Return argument type sbytes32 is not implicitly convertible to expected type (type of first return variable) bytes32.
// TypeError 7407: (355-367): Type sbytes32 is not implicitly convertible to expected type bytes32.
// TypeError 9553: (407-419): Invalid type for argument in function call. Invalid implicit conversion from sbytes32 to bytes32 requested.
