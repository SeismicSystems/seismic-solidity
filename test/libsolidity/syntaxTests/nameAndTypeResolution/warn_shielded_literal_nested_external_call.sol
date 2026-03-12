// Nested external calls — both emit context B warnings (10402)
contract A {
    function doSomething(suint256 x) external {}
}

contract B {
    function setVal(suint256 x) external {}
}

contract Caller {
    A a;
    B b;
    function test() external {
        // Both are external calls; the literal suint256(7) is in a.doSomething()
        // calldata. No warning expected.
        a.doSomething(suint256(7));
        b.setVal(suint256(42));
    }
}
// ----
// Warning 10402: (404-415): Literals converted to shielded integers will leak during contract deployment.
// Warning 10402: (435-447): Literals converted to shielded integers will leak during contract deployment.
