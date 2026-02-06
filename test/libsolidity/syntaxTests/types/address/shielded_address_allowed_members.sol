contract C {
    saddress private a;

    function testCode() external view returns (bytes memory) {
        return a.code;
    }

    function testCodehash() external view returns (bytes32) {
        return a.codehash;
    }
}
// ----
