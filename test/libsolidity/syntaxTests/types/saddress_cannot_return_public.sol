contract C {
    function f() public pure returns (saddress) {
        return saddress(address(1));
    }
}
// ----
// TypeError 10102: (51-59): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
