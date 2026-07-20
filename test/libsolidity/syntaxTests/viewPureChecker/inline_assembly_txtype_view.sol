contract C {
    function f() public view returns (uint256 t) {
        assembly {
            t := txtype()
        }
    }
}
// ----
