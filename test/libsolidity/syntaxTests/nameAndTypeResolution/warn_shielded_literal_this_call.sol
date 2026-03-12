// this.f() is an external call — emits context B warning (10402)
contract C {
    function setVal(suint256 x) external {}

    function test() external {
        this.setVal(suint256(42));
    }
}
// ----
// Warning 10402: (176-188): Literals converted to shielded integers will leak during contract deployment.
