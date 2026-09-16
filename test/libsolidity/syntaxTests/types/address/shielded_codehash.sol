contract C {
    function f() public view returns (bytes32) {
        return saddress(this).codehash;
    }
}
// ====
// EVMVersion: >=constantinople
// ----
