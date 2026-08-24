// Multiple external call targets — both emit context B warnings (10402)
contract TokenA {
    function transfer(suint256 amount) external {}
}

contract TokenB {
    function transfer(suint256 amount) external {}
}

contract Router {
    TokenA a;
    TokenB b;
    function test() external {
        a.transfer(suint256(100));
        b.transfer(suint256(200));
    }
}
// ----
// Warning 10402: (315-328): Literals converted to shielded integers will leak during contract deployment.
// Warning 10402: (350-363): Literals converted to shielded integers will leak during contract deployment.
