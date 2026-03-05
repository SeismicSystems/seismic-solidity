contract C {
    function f() public view returns (uint) {
        return block.timestamp;
    }
    function g() public view returns (uint) {
        return block.timestamp_ms;
    }
    function h() public view returns (uint) {
        return block.timestamp_seconds;
    }
}
// ====
// EVMVersion: >=mercury
// ----
