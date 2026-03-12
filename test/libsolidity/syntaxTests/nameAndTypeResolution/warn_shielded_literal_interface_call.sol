// Call through interface — emits context B warning (10402)
interface ITarget {
    function setVal(suint256 x) external;
}

contract Caller {
    ITarget t;
    function test() external {
        t.setVal(suint256(42));
    }
}
// ----
// Warning 10402: (208-220): Literals converted to shielded integers will leak during contract deployment.
