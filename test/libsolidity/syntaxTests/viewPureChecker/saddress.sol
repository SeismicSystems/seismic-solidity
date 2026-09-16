contract C {
    function h() public view returns (bytes32) {
        return saddress(0).codehash;
    }
    function g() public view returns (bytes memory) {
        return saddress(0).code;
    }
}
// ----
