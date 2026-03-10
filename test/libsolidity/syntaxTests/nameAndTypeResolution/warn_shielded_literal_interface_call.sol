// Call through interface — emits context B warning (5506)
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
// Warning 5506: (207-219): Literals converted to shielded integers will leak during contract deployment.
