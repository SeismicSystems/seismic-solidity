contract C {
    function f() public view returns (uint) {
        return block.timestamp_seconds;
    }
}
// ====
// EVMVersion: =cancun
// ----
// TypeError 8743: (74-97): "timestamp_seconds" is not supported by the VM version.
