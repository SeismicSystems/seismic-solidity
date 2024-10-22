contract C {
    function f() public returns (bool success) {
        (success, ) = (saddress(0)).call{value: 30}("");
    }
}
// ----
