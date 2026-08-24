contract C {
    suint8 private secret;
    bytes32 private bs;
    bytes32 public pub;
    sbytes32 private stored;
    event E(bytes32 v);
    error Err(bytes32 v);
    function sink(bytes32 v) external {}
    // bytesN << shielded yields sbytesN, so every public sink rejects it:
    function retSink() external view returns (bytes32) { return bs << secret; }
    function storeSink() external { pub = bs << secret; }
    function compoundSink() external { pub <<= secret; }
    function eventSink() external { emit E(bs << secret); }
    function callSink() external { this.sink(bs << secret); }
    function revertSink() external view { revert Err(bs << secret); }
    // shielded fixed-bytes sink is legal; public shift amount is unaffected
    function shieldedOk() external { stored = bs << secret; }
    function publicOk(uint8 n) external view returns (bytes32) { return bs << n; }
    // narrow width and right shift promote the same way
    function narrowRightSink() external view returns (bytes1) { bytes1 b; return b >> secret; }
}
// ----
// TypeError 6359: (347-359): Return argument type sbytes32 is not implicitly convertible to expected type (type of first return variable) bytes32.
// TypeError 7407: (405-417): Type sbytes32 is not implicitly convertible to expected type bytes32.
// TypeError 7366: (460-474): Operator <<= not compatible with types bytes32 and suint8.
// TypeError 9553: (521-533): Invalid type for argument in function call. Invalid implicit conversion from sbytes32 to bytes32 requested.
// TypeError 9553: (583-595): Invalid type for argument in function call. Invalid implicit conversion from sbytes32 to bytes32 requested.
// TypeError 9553: (653-665): Invalid type for argument in function call. Invalid implicit conversion from sbytes32 to bytes32 requested.
// TypeError 6359: (1030-1041): Return argument type sbytes1 is not implicitly convertible to expected type (type of first return variable) bytes1.
