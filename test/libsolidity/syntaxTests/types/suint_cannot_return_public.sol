contract C {
    function f() public pure returns (suint256) {
        return suint256(1);
    }
}
// ----
// TypeError 10102: (51-59): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// Warning 10403: (78-89): Literals converted to shielded integers will leak during contract deployment.
