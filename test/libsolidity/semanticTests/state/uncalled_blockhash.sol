contract C {
    function f() public returns (bytes32) {
        return (blockhash)(block.number - 1);
    }
}
// ----
// f() -> 0x044852b2a670ade5407e78fb2863c51de9fcb96542a07186fe3aeda6bb8a116d
