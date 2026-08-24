// External call with multiple shielded literal args — emits context B warnings
contract Target {
    function setVals(suint256 a, sbool b, suint128 c) external {}
}

contract Caller {
    Target t;
    function test() external {
        t.setVals(suint256(1), sbool(true), suint128(99));
    }
}
// ----
// Warning 10402: (250-261): Literals converted to shielded integers will leak during contract deployment.
// Warning 10405: (263-274): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 10402: (276-288): Literals converted to shielded integers will leak during contract deployment.
