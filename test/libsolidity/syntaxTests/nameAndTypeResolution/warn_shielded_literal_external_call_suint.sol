// External call with suint literal — emits context B warning (10402)
contract Target {
    function setVal(suint256 x) external {}
}

contract Caller {
    Target t;
    function test() external {
        t.setVal(suint256(42));
    }
}
// ----
// Warning 10402: (217-229): Literals converted to shielded integers will leak during contract deployment.
