// External call with suint literal — emits context B warning (5506)
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
// Warning 5506: (216-228): Literals converted to shielded integers will leak during contract deployment.
