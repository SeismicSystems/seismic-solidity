contract C {
    function f() public returns(bytes32) {
        return blockhash(0);
    }
    function g() public returns(bytes32) {
        return blockhash(1);
    }
    function h() public returns(bytes32) {
        return blockhash(2);
    }
}
// ----
// f() -> 0x044852b2a670ade5407e78fb2863c51de9fcb96542a07186fe3aeda6bb8a116d
// g() -> 0xc89efdaa54c0f20c7adf612882df0950f5a951637e0307cdcb4c672f298b8bc6
// h() -> 0xad7c5bef027816a800da1736444fb58a807ef4c9603b7848673f7e3a68eb14a5
