contract C {
    function f(suint160 x) public pure returns (address) {
        return address(x);
    }
}
// ----
